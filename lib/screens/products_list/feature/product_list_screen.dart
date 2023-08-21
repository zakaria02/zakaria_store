import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_scaffold.dart';
import '../../../common/constants/constants.dart';
import 'categories/views/categories_view.dart';
import 'products/views/products_view.dart';

/// Displays a list of product by there categories
/// [all products] category is selected by default

@RoutePage()
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: Constants.productListPageTitle,
      body: Column(
        children: [
          CategoriesView(),
          SizedBox(
            height: 30,
          ),
          ProductsView(),
        ],
      ),
    );
  }
}
