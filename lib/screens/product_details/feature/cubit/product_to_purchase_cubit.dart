import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../cart/models/product_to_purchase_uio.dart';

part 'product_to_purchase_state.dart';

class ProductToPurchaseCubit extends Cubit<ProductToPurchaseState> {
  ProductToPurchaseCubit() : super(const ProductToPurchaseInitial());

  void startPurchaseProduct(ProductToPurchaseUio product) {
    emit(ProductToPurchaseStart(product: product));
  }

  void updateQuantity(int quantity) {
    emit(ProductToPurchaseSuccess(
        product: state.product?.copyWith(quantity: quantity)));
  }
}
