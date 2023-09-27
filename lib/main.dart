import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'screens/cart/bloc/cart_bloc.dart';
import 'screens/cart/business/dtos/product_to_purchase_dto.dart';
import 'screens/product_details/feature/cubit/product_to_purchase_cubit.dart';
import 'screens/products_list/business/dtos/product_dto.dart';
import 'screens/products_list/feature/categories/bloc/categories_bloc.dart';
import 'screens/products_list/feature/products/bloc/products_bloc.dart';
import 'utils/bloc/bloc_observer.dart';
import 'utils/di/locator.dart';
import 'utils/network/app_path_provider.dart';
import 'utils/router/router.dart';

// this comment is used just to test the build ci

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This will let us observe any change that is happening in the Bloc
  Bloc.observer = AppBlocObserver();
  // Initialize [GetIt] locator
  AppLocator();
  // Init path provider for cache
  await AppPathProvider.initPath();
  // Initialize hive
  Hive
    ..init(AppPathProvider.path)
    ..registerAdapter(ProductToPurchaseDtoAdapter())
    ..registerAdapter(RatingDtoAdapter());

  // Launch App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoriesBloc()..add(FetchCategories()),
          ),
          BlocProvider(
            create: (context) => ProductsBloc()..add(FetchAllProducts()),
          ),
          BlocProvider(
            create: (context) => ProductToPurchaseCubit(),
          ),
          BlocProvider(
            create: (context) => CartBloc()..add(const FetchProductsFromCart()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter().config(),
        ));
  }
}
