import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../business/di/locator.dart';
import '../../../business/usecase/fetch_all_categories_usecase.dart';
import '../models/category_uio.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesInitial()) {
    on<FetchCategories>((event, emit) async {
      final FetchAllCategoriesUseCase fetchCategories = ProductsLocator().get();
      emit(CategoriesLoading(categories: state.categories));
      await fetchCategories.execute().then((categoriesDto) {
        emit(CategoriesSuccess(categories: categoriesDto.toCategoriesUio()));
      }).catchError((err) {
        emit(CategoriesFailure(
            categories: state.categories, errorMessage: err.toString()));
      });
    });
    on<UpdateSelectedCategory>((event, emit) {
      emit(CategoriesLoading(categories: state.categories));
      List<CategoryUio> categories = state.categories;
      for (CategoryUio category in categories) {
        category.selected = category.name == event.selectedCategory.name;
      }
      emit(CategoriesSuccess(categories: categories));
    });
  }
}
