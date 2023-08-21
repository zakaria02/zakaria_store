part of 'products_view.dart';

/// Displays [ProductUio] object data in a card widget

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final ProductUio product;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 260,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: FadeAnimation(
                            1,
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Image.network(
                                product.image,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    UniconsLine.image_slash,
                                    size: Constants.iconSize,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeAnimation(
                                1,
                                Text(
                                  product.title,
                                  style: Constants.h1,
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              FadeAnimation(
                                1.1,
                                Text(
                                  product.description,
                                  style: Constants.body,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SubTitle(
                                title: "Category",
                                value: product.category.name,
                              ),
                              SubTitle(
                                title: "Rating",
                                value: "${product.rating.rate} /5",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FadeAnimation(
                                1.3,
                                PriceWidget(price: product.price),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        1.2,
        Text(
          "$title: $value",
          style: Constants.h3,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
