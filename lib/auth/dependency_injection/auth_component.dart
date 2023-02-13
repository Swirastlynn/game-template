import 'package:game_template/auth/domain/log_in_use_case.dart';
import 'package:game_template/auth/login_page_connector.dart';
import 'package:game_template/auth/presentation/login_navigator.dart';
import 'package:game_template/auth/presentation/login_presentation_model.dart';
import 'package:game_template/auth/presentation/login_presenter.dart';
import 'package:game_template/core/dependency_injection/app_component.dart';

void configureDependencies() {
  _configureUseCases();
  _configureMvp();
}

void _configureUseCases() {
  serviceLocator.registerFactory<LoginUseCase>(
    () => LoginUseCase(
      serviceLocator(),
    ),
  );
}

void _configureMvp() {
  serviceLocator
    ..registerFactory<LoginNavigator>(
      () => LoginNavigator(serviceLocator()),
    )
    ..registerFactory<LoginPresentationModel>(
      () => LoginPresentationModel.initial(),
    )
    ..registerFactory<LoginPresenter>(
      () => LoginPresenter(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    ..registerFactory<LoginPageConnector>(
      () => LoginPageConnector(
        presenter: serviceLocator(),
      ),
    );
}
