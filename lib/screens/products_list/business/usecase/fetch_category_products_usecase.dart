import '../../../../common/constants/constants.dart';
import '../di/locator.dart';
import '../dtos/product_dto.dart';
import '../repository/products_repository.dart';

/// Fetch the selected category products
class FetchCategoryProductsUseCase {
  final ProductsRepository _productsRepository =
      ProductsLocator().get<ProductsRepository>();

  Future<List<ProductDto>> execute(String category) {
    return category == Constants.defaultCategoryName
        ? _productsRepository.fetchAllProducts()
        : _productsRepository.fetchCategoryProducts(category);
  }
}
