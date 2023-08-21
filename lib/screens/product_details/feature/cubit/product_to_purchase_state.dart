part of 'product_to_purchase_cubit.dart';

sealed class ProductToPurchaseState extends Equatable {
  const ProductToPurchaseState({required this.product});

  final ProductToPurchaseUio? product;

  @override
  List<Object?> get props => [product];
}

final class ProductToPurchaseInitial extends ProductToPurchaseState {
  const ProductToPurchaseInitial() : super(product: null);
}

final class ProductToPurchaseStart extends ProductToPurchaseState {
  const ProductToPurchaseStart({required super.product});
}

final class ProductToPurchaseSuccess extends ProductToPurchaseState {
  const ProductToPurchaseSuccess({required super.product});
}
