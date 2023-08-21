import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unicons/unicons.dart';
import '../../../../../common/animations/fade_animation.dart';
import '../../../../../common/widgets/price.dart';
import '../../../../../common/widgets/toast.dart';
import '../../../../../common/constants/constants.dart';
import '../bloc/products_bloc.dart';
import '../models/product_uio.dart';

part 'product_loading_view.dart';
part 'product_view.dart';

/// Displays the list of products with there information or loading widget

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, productsState) {
          if (productsState is ProductsFailure) {
            context.showFlash(
              barrierDismissible: true,
              duration: Constants.toastDuration,
              builder: (context, controller) {
                return ErrorToast(
                  title: Constants.networkErrorTitle,
                  message: productsState.errorMessage,
                  controller: controller,
                );
              },
            );
          }
        },
        builder: (context, productsState) {
          bool loading = productsState is ProductsLoading;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: loading ? 3 : productsState.products.length,
            itemBuilder: (context, index) {
              return loading
                  ? const ProductLoadingView()
                  : ProductView(
                      product: productsState.products[index],
                    );
            },
          );
        },
      ),
    );
  }
}
