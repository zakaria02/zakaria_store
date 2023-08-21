import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/products_list/feature/categories/bloc/categories_bloc.dart';
import 'utils/bloc/bloc_observer.dart';
import 'utils/di/locator.dart';
import 'utils/network/app_path_provider.dart';
import 'utils/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This will let us observe any change that is happening in the Bloc
  Bloc.observer = AppBlocObserver();
  // Initialize [GetIt] locator
  AppLocator();
  // Init path provider for cache
  await AppPathProvider.initPath();
  // Launch App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoriesBloc()..add(FetchCategories()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter().config(),
        ));
  }
}
