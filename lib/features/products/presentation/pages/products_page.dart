import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/presentation/cubit/category_cubit.dart';
import '../cubit/product_cubit.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Column(
        children: [
          const _CategorySelector(),
          Expanded(
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ListTile(
                        title: Text(product.title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$${product.price}'),
                            const SizedBox(height: 4),
                            Chip(
                              label: Text(product.category),
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SizedBox(
            height: 56,
            child: Center(child: LinearProgressIndicator()),
          );
        }

        if (state is CategoryError) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Text(state.message),
          );
        }

        if (state is! CategoryLoaded) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 56,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: state.categories.length + 1,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              if (index == 0) {
                return ChoiceChip(
                  label: const Text('All'),
                  selected: state.selectedSlug == null,
                  onSelected: (_) {
                    context.read<CategoryCubit>().selectCategory(null);
                    context.read<ProductCubit>().getProducts();
                  },
                );
              }

              final category = state.categories[index - 1];
              return ChoiceChip(
                label: Text(category.name),
                selected: state.selectedSlug == category.slug,
                onSelected: (_) {
                  context.read<CategoryCubit>().selectCategory(category.slug);
                  context.read<ProductCubit>().getProductsByCategory(
                        category.slug,
                      );
                },
              );
            },
          ),
        );
      },
    );
  }
}
