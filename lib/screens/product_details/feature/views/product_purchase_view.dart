part of '../product_details_screen.dart';

class ProductPurchase extends StatelessWidget {
  const ProductPurchase({super.key, required this.price});
  final double price;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
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
              press: () {},
            ),
          )
        ],
      ),
    );
  }
}
