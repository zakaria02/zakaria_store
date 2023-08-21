import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/widgets/toast.dart';
import '../../../../../common/constants/constants.dart';
import '../../products/bloc/products_bloc.dart';
import '../bloc/categories_bloc.dart';

part 'category_view.dart';
part 'category_loading_view.dart';

/// Displays the list of categories with there names or loading widget
/// In case of a success, the first category of the list is selected by default

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, categoriesState) {
        if (categoriesState is CategoriesFailure) {
          context.showFlash(
            barrierDismissible: true,
            duration: const Duration(seconds: 10),
            builder: (context, controller) {
              return ErrorToast(
                title: Constants.networkErrorTitle,
                message: categoriesState.errorMessage,
                controller: controller,
              );
            },
          );
        }
      },
      builder: (context, categoriesState) {
        bool loading = categoriesState is CategoriesLoading;
        return SizedBox(
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: loading ? 5 : categoriesState.categories.length,
            itemBuilder: (context, index) {
              return loading
                  ? const CategoryLoadingView()
                  : CategoryView(
                      category: categoriesState.categories[index],
                    );
            },
          ),
        );
      },
    );
  }
}
