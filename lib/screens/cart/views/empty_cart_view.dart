part of '../cart_screen.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.8,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              Constants.emptyCartAsset,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(Constants.emptyCartMessage, style: Constants.h2),
          const SizedBox(
            height: 30,
          ),
          RoundedButton(
            text: Constants.emptyCartButtonText,
            color: Constants.buttonColor,
            textColor: Constants.buttonTextColor,
            press: () => context.router.pop(),
          )
        ],
      ),
    );
  }
}
