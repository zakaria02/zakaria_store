import 'package:auto_route/auto_route.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unicons/unicons.dart';

import '../../../common/constants/constants.dart';
import '../../common/animations/fade_animation.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/network_image_or_default.dart';
import '../../common/widgets/price.dart';
import '../../common/widgets/rounded_button.dart';
import '../../common/widgets/toast.dart';
import 'bloc/cart_bloc.dart';
import 'models/product_to_purchase_uio.dart';

part 'views/cart_view.dart';
part 'views/empty_cart_view.dart';

/// Displays the list of products added to cart with possibility
/// to update quantity or remove a product
/// If no product added yet, the page dispalys [EmptyCartView]

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, cartState) {
        if (cartState is CartFailure) {
          context.showFlash(
            barrierDismissible: true,
            duration: Constants.toastDuration,
            builder: (context, controller) {
              return ErrorToast(
                title: Constants.cartCheckoutTitle,
                message: cartState.errorMessage,
                controller: controller,
              );
            },
          );
        }
      },
      builder: (context, cartState) {
        return CustomScaffold(
          title: Constants.cartPageTitle,
          body: cartState.products.isEmpty
              ? const EmptyCartView()
              : CartView(
                  products: cartState.products,
                ),
        );
      },
    );
  }
}
