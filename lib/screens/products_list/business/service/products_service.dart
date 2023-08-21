import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../common/constants/constants.dart';
import '../dtos/product_dto.dart';

part 'products_service.g.dart';

/// All product calls service
/// [fetchCategories] fetch the list of products categories
/// [fetchAllProducts] fetch all products of all categories
@RestApi(baseUrl: Constants.baseUrl)
abstract class ProductsService {
  factory ProductsService(Dio dio, {String baseUrl}) = _ProductsService;

  @GET("/products/categories")
  Future<List<String>> fetchCategories();

  @GET("/products")
  Future<List<ProductDto>> fetchAllProducts();
}
