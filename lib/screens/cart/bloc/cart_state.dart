part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState({required this.products});

  final List<ProductToPurchaseUio> products;

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {
  const CartInitial() : super(products: const []);
}

final class CartLoading extends CartState {
  const CartLoading({required super.products});
}

final class CartSuccess extends CartState {
  const CartSuccess({this.successMessage, required super.products});

  final String? successMessage;
}

final class AddProductSuccess extends CartState {
  const AddProductSuccess({required super.products});
}

final class CartFailure extends CartState {
  const CartFailure(this.errorMessage, {required super.products});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
