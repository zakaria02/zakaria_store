import '../di/locator.dart';
import '../dtos/product_to_purchase_dto.dart';
import '../service/cart_local_data_source.dart';

class AddProductToCartUseCase {
  final CartService cartService = CartLocator().get();
  Future<void> execute(ProductToPurchaseDto product) {
    return cartService.saveProduct(product);
  }
}
