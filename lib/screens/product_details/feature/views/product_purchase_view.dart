part of '../product_details_screen.dart';

class ProductPurchase extends StatelessWidget {
  const ProductPurchase(
      {super.key, required this.price, required this.addToCart});

  final double price;
  final VoidCallback addToCart;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, cartState) {
        if (cartState is CartFailure) {
          context.showFlash(
            barrierDismissible: true,
            duration: Constants.toastDuration,
            builder: (context, controller) {
              return ErrorToast(
                title: Constants.addProductTitle,
                message: cartState.errorMessage,
                controller: controller,
              );
            },
          );
        } else if (cartState is CartSuccess &&
            cartState.successMessage != null) {
          context.showFlash(
            barrierDismissible: true,
            duration: Constants.toastDuration,
            builder: (context, controller) {
              return SuccessToast(
                title: Constants.addProductTitle,
                message: cartState.successMessage!,
                controller: controller,
              );
            },
          );
        }
      },
      child: FadeAnimation(
        1.2,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total price",
                  style: Constants.subTitleStyle,
                  textAlign: TextAlign.start,
                ),
                Text(
                  "${price.toStringAsFixed(2)} €",
                  style: Constants.h2,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            Expanded(
              child: RoundedButton(
                text: "Add to Cart",
                icon: UniconsLine.shopping_bag,
                color: Constants.buttonColor,
                textColor: Constants.buttonTextColor,
                press: addToCart,
              ),
            )
          ],
        ),
      ),
    );
  }
}
