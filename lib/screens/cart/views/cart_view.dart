part of '../cart_screen.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.products});

  final List<ProductToPurchaseUio> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAnimation(
          0.5,
          Text(
            Constants.cartPageTitle,
            style: Constants.h2,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _CartItemView(
                product: products[index],
                fadeDelay: 0.2 * (index + 1),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CartItemView extends StatelessWidget {
  const _CartItemView({required this.product, required this.fadeDelay});
  final ProductToPurchaseUio product;
  final double fadeDelay;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.5 + fadeDelay,
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: NetworkImageOrDefault(
                  imageUrl: product.image,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    style: Constants.h3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Quantity: ${product.quantity}",
                    style: Constants.body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PriceWidget(
                    price: product.totalPrice,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(Constants.iconSize),
              ),
              child: IconButton(
                icon: const Icon(
                  UniconsLine.trash_alt,
                  size: Constants.iconSize,
                ),
                color: Colors.redAccent,
                onPressed: () => BlocProvider.of<CartBloc>(context)
                    .add(RemoveProductFromCart(product: product)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
