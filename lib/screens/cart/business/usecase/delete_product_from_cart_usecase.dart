import '../di/locator.dart';
import '../dtos/product_to_purchase_dto.dart';
import '../service/cart_local_data_source.dart';

class DeleteProductFromCartUseCase {
  final CartService cartService = CartLocator().get();
  Future<void> execute(ProductToPurchaseDto product) {
    return cartService.deleteProduct(product.id);
  }
}
