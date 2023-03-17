import 'package:get_it/get_it.dart';
import 'package:singleton_demo/data/dummy_data.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton<UserData>(() => UserData());
  locator.registerLazySingleton<Employee>(() => Employee());
}
