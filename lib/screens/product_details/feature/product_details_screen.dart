import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'cubit/product_to_purchase_cubit.dart';

part 'views/product_top_info_view.dart';
part 'views/product_detailed_info_view.dart';
part 'views/product_purchase_view.dart';

/// Display [ProductUio] detailed infos and give the use the possibility to
/// Add product to card
@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductToPurchaseCubit, ProductToPurchaseState>(
      builder: (context, productToPurchaseState) {
        return CustomScaffold(
          title: productToPurchaseState.product!.title,
          body: ListView(
            children: [
              ProductTopInfo(
                imageUrl: productToPurchaseState.product!.image,
                title: productToPurchaseState.product!.title,
                price: productToPurchaseState.product!.unitPrice,
                rating: productToPurchaseState.product!.rating,
              ),
              ProductDetailedInfo(
                description: productToPurchaseState.product!.description,
                quantity: productToPurchaseState.product!.quantity,
              ),
              ProductPurchase(
                price: productToPurchaseState.product!.totalPrice,
              ),
            ],
          ),
        );
      },
    );
  }
}
