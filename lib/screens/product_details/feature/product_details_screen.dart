import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_touch_spin/flutter_touch_spin.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../common/animations/fade_animation.dart';
import '../../../common/constants/constants.dart';
import '../../../common/widgets/custom_scaffold.dart';
import '../../../common/widgets/price.dart';
import '../../../common/widgets/rounded_button.dart';
import '../../products_list/feature/products/models/product_uio.dart';

part 'views/product_top_info_view.dart';
part 'views/product_detailed_info_view.dart';
part 'views/product_purchase_view.dart';

/// Display [ProductUio] detailed infos and give the use the possibility to
/// Add product to card
@RoutePage()
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final ProductUio product;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: product.title,
      body: ListView(
        children: [
          ProductTopInfo(
            imageUrl: product.image,
            title: product.title,
            price: product.price,
            rating: product.rating,
          ),
          ProductDetailedInfo(
            description: product.description,
            quantity: 1,
          ),
          ProductPurchase(
            price: product.price,
          ),
        ],
      ),
    );
  }
}
