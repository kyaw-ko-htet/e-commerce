part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;
  final String? selectedSlug;

  const CategoryLoaded({required this.categories, this.selectedSlug});

  CategoryLoaded copyWith({
    List<CategoryModel>? categories,
    Object? selectedSlug = _unset,
  }) {
    return CategoryLoaded(
      categories: categories ?? this.categories,
      selectedSlug: selectedSlug == _unset
          ? this.selectedSlug
          : selectedSlug as String?,
    );
  }

  @override
  List<Object?> get props => [categories, selectedSlug];
}

final class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}

const Object _unset = Object();
