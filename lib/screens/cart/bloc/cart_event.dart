part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddProductToCart extends CartEvent {
  final ProductToPurchaseUio product;
  const AddProductToCart({required this.product});

  @override
  List<Object> get props => [product];
}

final class FetchProductsFromCart extends CartEvent {
  const FetchProductsFromCart();
}

final class RemoveProductFromCart extends CartEvent {
  final ProductToPurchaseUio product;
  const RemoveProductFromCart({required this.product});

  @override
  List<Object> get props => [product];
}
