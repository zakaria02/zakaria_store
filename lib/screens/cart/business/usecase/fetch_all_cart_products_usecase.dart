import '../di/locator.dart';
import '../dtos/product_to_purchase_dto.dart';
import '../service/cart_local_data_source.dart';

class FetchAllCartProductsUseCase {
  final CartService cartService = CartLocator().get();
  Future<List<ProductToPurchaseDto>> execute() {
    return cartService.fetchProducts();
  }
}
