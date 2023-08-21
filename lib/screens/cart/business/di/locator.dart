import 'package:get_it/get_it.dart';
import '../../../../utils/di/abstract_locator.dart';
import '../service/cart_local_data_source.dart';
import '../usecase/add_product_to_cart_usecase.dart';
import '../usecase/delete_product_from_cart_usecase.dart';
import '../usecase/fetch_all_cart_products_usecase.dart';

class CartLocator extends AbstractLocator {
  static final CartLocator _cartLocator = CartLocator._internal();

  factory CartLocator() {
    return _cartLocator;
  }

  CartLocator._internal();
  @override
  void setUp(GetIt serviceLocator) {
    // Service
    serviceLocator.registerLazySingleton<CartService>(() => CartService());
    // UseCase
    serviceLocator.registerLazySingleton<AddProductToCartUseCase>(
        () => AddProductToCartUseCase());
    serviceLocator.registerLazySingleton<FetchAllCartProductsUseCase>(
        () => FetchAllCartProductsUseCase());
    serviceLocator.registerLazySingleton<DeleteProductFromCartUseCase>(
        () => DeleteProductFromCartUseCase());
  }
}
