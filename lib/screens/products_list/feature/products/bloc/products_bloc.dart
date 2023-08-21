import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../common/constants/constants.dart';
import '../../../business/di/locator.dart';
import '../../../business/usecase/fetch_all_products_usecase.dart';
import '../../../business/usecase/fetch_category_products_usecase.dart';
import '../models/product_uio.dart';
import '../../../business/dtos/product_dto.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsInitial()) {
    on<FetchAllProducts>((event, emit) async {
      final FetchAllProductsUseCase fetchAllProductsUseCase =
          ProductsLocator().get();
      emit(ProductsLoading(products: state.products, category: state.category));

      await fetchAllProductsUseCase.execute().then((productsDto) {
        emit(ProductsSuccess(
            products: productsDto
                .map((productDto) => productDto.toProductUio())
                .toList(),
            category: state.category));
      }).catchError((err) {
        emit(
          ProductsFailure(
            products: state.products,
            errorMessage: err.toString(),
            category: state.category,
          ),
        );
      });
    });
    on<FetchCategoryProducts>((event, emit) async {
      final FetchCategoryProductsUseCase fetchCategoryProductsUseCase =
          ProductsLocator().get();
      final String currentCategory = state.category;
      final String selectedCategory = event.selectedCategory;
      emit(ProductsLoading(
          products: state.products, category: selectedCategory));
      await fetchCategoryProductsUseCase
          .execute(event.selectedCategory)
          .then((productsDto) {
        emit(
          ProductsSuccess(
            products: productsDto
                .map((productDto) => productDto.toProductUio())
                .toList(),
            category: selectedCategory,
          ),
        );
      }).catchError((err) {
        emit(
          ProductsFailure(
            products: state.products,
            errorMessage: err.toString(),
            category: currentCategory,
          ),
        );
      });
    });
  }
}
