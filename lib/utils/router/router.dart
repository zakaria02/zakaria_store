import 'package:auto_route/auto_route.dart';

import '../../screens/product_list/feature/product_list_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// add your routes here
        AutoRoute(page: ProductListRoute.page, initial: true),
      ];
}
