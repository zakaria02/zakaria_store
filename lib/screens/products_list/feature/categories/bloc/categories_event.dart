part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

final class FetchCategories extends CategoriesEvent {}

final class UpdateSelectedCategory extends CategoriesEvent {
  const UpdateSelectedCategory({required this.selectedCategory});
  final CategoryUio selectedCategory;

  @override
  List<Object> get props => [selectedCategory];
}
