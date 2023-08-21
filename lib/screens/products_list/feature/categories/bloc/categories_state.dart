part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState({required this.categories});
  final List<CategoryUio> categories;

  @override
  List<Object> get props => [categories];
}

final class CategoriesInitial extends CategoriesState {
  // Empty list of categories in the initial state
  const CategoriesInitial() : super(categories: const []);
}

final class CategoriesLoading extends CategoriesState {
  const CategoriesLoading({required super.categories});
}

final class CategoriesSuccess extends CategoriesState {
  const CategoriesSuccess({required super.categories});
}

final class CategoriesFailure extends CategoriesState {
  const CategoriesFailure({required categories, required this.errorMessage})
      : super(categories: categories);

  final String errorMessage;

  @override
  List<Object> get props => [categories, errorMessage];
}
