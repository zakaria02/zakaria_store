import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../screens/product_details/feature/product_details_screen.dart';
import '../../screens/products_list/feature/product_list_screen.dart';
import '../../screens/products_list/feature/products/models/product_uio.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// add your routes here
        AutoRoute(page: ProductListRoute.page, initial: true),
        AutoRoute(page: ProductDetailsRoute.page),
      ];
}
