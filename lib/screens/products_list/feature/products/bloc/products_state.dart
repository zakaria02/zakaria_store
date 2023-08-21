part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState({required this.products});
  final List<ProductUio> products;

  @override
  List<Object> get props => [products];
}

final class ProductsInitial extends ProductsState {
  // Empty list of Products in the initial state
  const ProductsInitial() : super(products: const []);
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading({required super.products});
}

final class ProductsSuccess extends ProductsState {
  const ProductsSuccess({required super.products});
}

final class ProductsFailure extends ProductsState {
  const ProductsFailure({required products, required this.errorMessage})
      : super(products: products);

  final String errorMessage;

  @override
  List<Object> get props => [products, errorMessage];
}
