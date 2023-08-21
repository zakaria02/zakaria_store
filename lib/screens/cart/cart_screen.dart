import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/animations/fade_animation.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/constants/constants.dart';
import '../../common/widgets/rounded_button.dart';

part 'views/empty_cart_view.dart';

/// Displays the list of products added to cart with possibility
/// to update quantity or remove a product
/// If no product added yet, the page dispalys [EmptyCartView]

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: Constants.cartPageTitle,
      body: EmptyCartView(),
    );
  }
}
