import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/bloc/bloc_observer.dart';
import 'utils/di/locator.dart';

void main() {
  // This will let us observe any change that is happening in the Bloc
  Bloc.observer = AppBlocObserver();
  // Initialize [GetIt] locator
  AppLocator();
  // Launch App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
