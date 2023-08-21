part of '../product_details_screen.dart';

class ProductNotFoundView extends StatelessWidget {
  const ProductNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          Constants.noProductFoundAsset,
          height: 400,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          Constants.noProductFoundText,
          style: Constants.h2,
        ),
        const SizedBox(
          height: 30,
        ),
        RoundedButton(
          text: Constants.noProductFoundButtonText,
          color: Constants.buttonColor,
          textColor: Constants.buttonTextColor,
          press: () => context.router.pop(),
        )
      ],
    );
  }
}
