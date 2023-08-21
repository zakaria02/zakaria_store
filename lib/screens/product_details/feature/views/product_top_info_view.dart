part of '../product_details_screen.dart';

class ProductTopInfo extends StatelessWidget {
  const ProductTopInfo({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
  });
  final String imageUrl;
  final String title;
  final double price;
  final RatingUio rating;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.7,
      Column(
        children: [
          NetworkImageOrDefault(
            imageUrl: imageUrl,
            height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Constants.h1,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              PriceWidget(
                price: price,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              RatingBarIndicator(
                direction: Axis.horizontal,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                rating: rating.rate,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                "(${rating.count} reviewers)",
                style: Constants.subTitleStyle,
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
