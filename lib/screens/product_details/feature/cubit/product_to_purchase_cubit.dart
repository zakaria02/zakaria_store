import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../cart/models/product_to_purchase_uio.dart';

part 'product_to_purchase_state.dart';

/* 
* To manage to [ProdutToPurchaseUio] object quantity we can use a provider listenner
* or a stateful widget with a direct set state, but as I already used bloc I preferred
* to stay in the same logic and create this cubit to manage this data
*/
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
