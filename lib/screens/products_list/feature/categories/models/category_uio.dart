class CategoryUio {
  final String name;
  bool selected;

  CategoryUio({
    required this.name,
    required this.selected,
  });
}

extension CategoryUioMappers on List<String> {
  List<CategoryUio> toCategoriesUio() {
    List<CategoryUio> categoriesUio = [
      CategoryUio(name: "all products", selected: true)
    ];
    categoriesUio.addAll(map((categoryString) =>
        CategoryUio(name: categoryString, selected: false)).toList());
    return categoriesUio;
  }
}
