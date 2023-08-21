part of 'products_view.dart';

/// Displays a loading widget if products state is Loading

class ProductLoadingView extends StatelessWidget {
  const ProductLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[100]!,
                    blurRadius: 10,
                    offset: const Offset(0, 10))
              ],
            ),
          )),
    );
  }
}
