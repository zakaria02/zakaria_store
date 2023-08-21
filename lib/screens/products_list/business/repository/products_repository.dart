import '../dtos/product_dto.dart';

abstract class ProductsRepository {
  Future<List<String>> fetchCategories();
  Future<List<ProductDto>> fetchAllProducts();
}
