import 'package:get_it/get_it.dart';

import '../network/locator.dart';
import 'abstract_locator.dart';

/// The main [GetIt] locator where we set up all the app locators
class AppLocator extends AbstractLocator {
  static final AppLocator _appLocator = AppLocator._internal();

  factory AppLocator() {
    return _appLocator;
  }

  AppLocator._internal() {
    setUp(serviceLocator);
  }

  @override
  void setUp(GetIt serviceLocator) {
    // Add your locators here
    DioLocator().setUp(serviceLocator);
  }
}
