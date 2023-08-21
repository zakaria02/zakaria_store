part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState({required this.category, required this.products});
  final List<ProductUio> products;
  final String category;

  @override
  List<Object> get props => [products];
}

final class ProductsInitial extends ProductsState {
  // Empty list of Products in the initial state
  const ProductsInitial()
      : super(products: const [], category: Constants.defaultCategoryName);
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading({required super.category, required super.products});
}

final class ProductsSuccess extends ProductsState {
  const ProductsSuccess({required super.category, required super.products});
}

final class ProductsFailure extends ProductsState {
  const ProductsFailure(
      {required products, required category, required this.errorMessage})
      : super(products: products, category: category);

  final String errorMessage;

  @override
  List<Object> get props => [products, errorMessage];
}
