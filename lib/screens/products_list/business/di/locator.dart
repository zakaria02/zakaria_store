import 'package:get_it/get_it.dart';
import '../../../../utils/di/abstract_locator.dart';
import '../../../../utils/network/dio_builder.dart';
import '../../../../utils/network/locator.dart';
import '../repository/products_repository.dart';
import '../repository/products_repository_impl.dart';
import '../service/products_service.dart';
import '../usecase/fetch_all_categories_usecase.dart';
import '../usecase/fetch_all_products_usecase.dart';
import '../usecase/fetch_category_products_usecase.dart';

/// Products locator contains
/// [ProductsService]
/// [ProductsRepository]
/// [FetchAllCategoriesUseCase]

class ProductsLocator extends AbstractLocator {
  static final ProductsLocator _productsLocator = ProductsLocator._internal();

  factory ProductsLocator() {
    return _productsLocator;
  }

  ProductsLocator._internal();
  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerLazySingleton<ProductsService>(
        () => ProductsService(DioLocator().get<DioBuilder>().dio));
    serviceLocator.registerLazySingleton<ProductsRepository>(
        () => ProductsRepositoryImpl());
    serviceLocator.registerLazySingleton<FetchAllCategoriesUseCase>(
        () => FetchAllCategoriesUseCase());
    serviceLocator.registerLazySingleton<FetchAllProductsUseCase>(
        () => FetchAllProductsUseCase());
    serviceLocator.registerLazySingleton<FetchCategoryProductsUseCase>(
        () => FetchCategoryProductsUseCase());
  }
}
