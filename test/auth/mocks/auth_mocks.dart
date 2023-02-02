import 'package:mocktail/mocktail.dart';

import 'auth_mocks_definitions.dart';

class AuthMocks {
  static late MockLoginPresenter loginPresenter;
  static late MockLoginPresentationModel loginPresentationModel;
  static late MockLoginNavigator loginNavigator;

  static late MockLogInFailure logInFailure;
  static late MockLogInUseCase logInUseCase;

  static void init() {
    _initMocks();
    _initFallbacks();
  }

  static void _initMocks() {
    loginPresenter = MockLoginPresenter();
    loginPresentationModel = MockLoginPresentationModel();
    loginNavigator = MockLoginNavigator();
    logInFailure = MockLogInFailure();
    logInUseCase = MockLogInUseCase();
  }

  static void _initFallbacks() {
    registerFallbackValue(MockLoginPresenter());
    registerFallbackValue(MockLoginPresentationModel());
    registerFallbackValue(MockLoginNavigator());

    registerFallbackValue(MockLogInFailure());
    registerFallbackValue(MockLogInUseCase());
  }
}
