import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/category_model.dart';
import '../../data/repository/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository repository;
  CategoryCubit(this.repository) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await repository.getCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  void selectCategory(String? slug) {
    final currentState = state;
    if (currentState is CategoryLoaded) {
      emit(currentState.copyWith(selectedSlug: slug));
    }
  }
}
