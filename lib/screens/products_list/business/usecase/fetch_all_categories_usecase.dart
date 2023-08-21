import '../di/locator.dart';
import '../repository/products_repository.dart';

/// Fetch all products categories
class FetchAllCategoriesUseCase {
  final ProductsRepository _productsRepository = ProductsLocator().get();

  Future<List<String>> execute() {
    return _productsRepository.fetchCategories();
  }
}
