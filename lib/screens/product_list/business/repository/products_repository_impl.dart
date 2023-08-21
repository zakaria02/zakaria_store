import '../di/locator.dart';
import '../service/products_service.dart';
import 'products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsService _productsService = ProductsLocator().get();

  @override
  Future<List<String>> fetchCategories() {
    return _productsService.fetchCategories();
  }
}
