import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../business/di/locator.dart';
import '../../../business/usecase/fetch_all_products_usecase.dart';
import '../models/product_uio.dart';
import '../../../business/dtos/product_dto.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsInitial()) {
    on<FetchAllProducts>((event, emit) async {
      final FetchAllProductsUseCase fetchAllProductsUseCase =
          ProductsLocator().get();
      emit(ProductsLoading(products: state.products));
      await fetchAllProductsUseCase.execute().then((productsDto) {
        emit(ProductsSuccess(
            products: productsDto
                .map((productDto) => productDto.toProductUio())
                .toList()));
      }).catchError((err) {
        emit(ProductsFailure(
            products: state.products, errorMessage: err.toString()));
      });
    });
  }
}
