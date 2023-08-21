part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllProducts extends ProductsEvent {}

final class FetchCategoryProducts extends ProductsEvent {
  final String selectedCategory;

  const FetchCategoryProducts({required this.selectedCategory});

  @override
  List<Object> get props => [selectedCategory];
}
