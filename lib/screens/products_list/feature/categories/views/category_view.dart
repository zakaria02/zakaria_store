part of 'categories_view.dart';

/// Displays a category name
/// if selected the color is [Constants.selectedCategoryColor] else it's [Constants.defaultCategoryColor]
class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ProductsBloc>(context)
            .add(FetchCategoryProducts(selectedCategory: category));
      },
      child: AspectRatio(
          aspectRatio: category.length / 3.6,
          child: Container(
            decoration: BoxDecoration(
              color: category == context.watch<ProductsBloc>().state.category
                  ? Constants.selectedCategoryColor
                  : Constants.defaultCategoryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                category,
                style: Constants.categoryTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
