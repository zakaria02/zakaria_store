import '../di/locator.dart';
import '../dtos/product_dto.dart';
import '../repository/products_repository.dart';

// Fetch all products
class FetchAllProductsUseCase {
  final ProductsRepository _productsRepository = ProductsLocator().get();

  Future<List<ProductDto>> execute() {
    return _productsRepository.fetchAllProducts();
  }
}
