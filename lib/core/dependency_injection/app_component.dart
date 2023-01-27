import 'package:game_template/core/stores/user_store.dart';
import 'package:game_template/navigation/app_navigator.dart';
import 'package:get_it/get_it.dart';
import 'package:game_template/auth/dependency_injection/auth_component.dart'
    as auth;

final serviceLocator = GetIt.instance;

void configureDependencies() {
  auth.configureDependencies();

  _configureGeneralDependencies();
  _configureStores();
}

void _configureGeneralDependencies() {
  serviceLocator.registerFactory<AppNavigator>(
    () => AppNavigator(),
  );
}

void _configureStores() {
  serviceLocator.registerSingleton<UserStore>(
    UserStore(),
  );
}
