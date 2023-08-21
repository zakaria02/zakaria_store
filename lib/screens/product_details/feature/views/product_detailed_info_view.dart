part of '../product_details_screen.dart';

class ProductDetailedInfo extends StatelessWidget {
  const ProductDetailedInfo(
      {super.key, required this.description, required this.quantity});
  final String description;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: Constants.h2,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: Constants.body,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Quantity",
                style: Constants.h2,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100],
                ),
                child: TouchSpin(
                  min: 1,
                  max: 9999,
                  value: 1,
                  iconPadding: const EdgeInsets.symmetric(horizontal: 20),
                  displayFormat: NumberFormat.compact(),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 1.3,
          ),
        ],
      ),
    );
  }
}
