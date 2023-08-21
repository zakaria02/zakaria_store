import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/constants/constants.dart';
import '../business/di/locator.dart';
import '../business/usecase/add_product_to_cart_usecase.dart';
import '../business/usecase/delete_product_from_cart_usecase.dart';
import '../business/usecase/fetch_all_cart_products_usecase.dart';
import '../models/product_to_purchase_uio.dart';
import '../business/dtos/product_to_purchase_dto.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial()) {
    on<AddProductToCart>((event, emit) async {
      AddProductToCartUseCase addProductToCartUseCase = CartLocator().get();
      emit(CartLoading(products: state.products));
      // Add product to hive box
      await addProductToCartUseCase
          .execute(event.product.toProductToPurchaseDto())
          .catchError((err) {
        emit(CartFailure(err.toString(), products: state.products));
        return;
      }).then((value) async {
        // Fetch all products
        await fetchAllProducts(emit, state,
            successMessage: Constants.addProductMessage);
      });
    });
    on<FetchProductsFromCart>((event, emit) async {
      await fetchAllProducts(emit, state);
    });
    on<RemoveProductFromCart>((event, emit) async {
      DeleteProductFromCartUseCase deleteProductFromCartUseCase =
          CartLocator().get();
      emit(CartLoading(products: state.products));
      // Checkout
      await deleteProductFromCartUseCase
          .execute(event.product.toProductToPurchaseDto())
          .catchError((err) {
        emit(CartFailure(err.toString(), products: state.products));
        return;
      }).then((value) async {
        // Fetch all products
        await fetchAllProducts(emit, state);
      });
    });
  }
}

Future<void> fetchAllProducts(Emitter<CartState> emit, CartState state,
    {String? successMessage}) async {
  FetchAllCartProductsUseCase fetchAllProductsUseCase = CartLocator().get();
  await fetchAllProductsUseCase.execute().then((products) {
    emit(CartSuccess(
        products: products
            .map((product) => product.toProductToPurchaseUio())
            .toList(),
        successMessage: successMessage));
  }).catchError((err) {
    emit(CartFailure(err.toString(), products: state.products));
  });
}
