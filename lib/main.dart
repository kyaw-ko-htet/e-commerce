import 'package:e_commerce/core/di/injection.dart' as di;
import 'package:e_commerce/features/categories/presentation/cubit/category_cubit.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:e_commerce/features/products/presentation/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.getIt<ProductCubit>()..getProducts()),
          BlocProvider(
            create: (_) => di.getIt<CategoryCubit>()..getCategories(),
          ),
        ],
        child: const ProductsPage(),
      ),
    );
  }
}
