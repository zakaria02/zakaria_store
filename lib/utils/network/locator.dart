import 'package:get_it/get_it.dart';
import '../di/abstract_locator.dart';
import 'dio_builder.dart';

class DioLocator extends AbstractLocator {
  static final DioLocator _dioLocator = DioLocator._internal();

  factory DioLocator() {
    return _dioLocator;
  }

  DioLocator._internal();
  @override
  void setUp(GetIt serviceLocator) {
    serviceLocator.registerFactory<DioBuilder>(() => DioBuilder());
  }
}
