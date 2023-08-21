part of 'categories_view.dart';

/// Displays a category name
/// if selected the color is [Constants.selectedCategoryColor] else it's [Constants.defaultCategoryColor]
class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final CategoryUio category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CategoriesBloc>(context)
            .add(UpdateSelectedCategory(selectedCategory: category));
      },
      child: AspectRatio(
          aspectRatio: category.name.length / 3.6,
          child: Container(
            decoration: BoxDecoration(
              color: category.selected
                  ? Constants.selectedCategoryColor
                  : Constants.defaultCategoryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                category.name,
                style: Constants.categoryTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
