import 'package:flutter_test/flutter_test.dart';
import 'package:game_template/auth/domain/log_in_failure.dart';
import 'package:game_template/auth/presentation/login_presentation_model.dart';
import 'package:game_template/auth/presentation/login_presenter.dart';
import 'package:game_template/core/domain/user.dart';
import 'package:game_template/core/utils/either_extensions.dart';
import 'package:game_template/localization/app_localizations_utils.dart';
import 'package:game_template/main.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

import '../../core/mocks/mocks.dart';
import '../mocks/auth_mocks_definitions.dart';

void main() {
  isUnitTests = true;
  late LoginPresentationModel model;
  late MockLoginNavigator navigator;
  late MockLogInUseCase useCase;
  late LoginPresenter presenter;

  setUp(() {
    Mocks.init();
    overrideAppLocalizations(AppLocalizationsEn());

    model = LoginPresentationModel.initial();
    navigator = MockLoginNavigator();
    useCase = MockLogInUseCase();
    presenter = LoginPresenter(
      model,
      navigator,
      useCase,
    );
  });

  tearDown(() {
    resetMocktailState();
  });

  test(
    'WHEN successful login THEN show success alert',
    () async {
      when(() => useCase.execute(
            username: any(named: 'username'),
            password: any(named: 'password'),
          )).thenAnswer((_) => successFuture(const User.anonymous()));
      when(() => navigator.showAlert(
            title: any(named: 'title'),
            message: any(named: 'message'),
          )).thenAnswer((_) => Future.value());
      await presenter.login();

      verify(() => useCase.execute(
            username: any(named: 'username'),
            password: any(named: 'password'),
          )).called(1);
      verify(() => navigator.showAlert(
            title: any(named: 'title'),
            message: any(named: 'message'),
          )).called(1);
    },
  );

  test(
    'WHEN failed login THEN show error alert',
    () async {
      when(() => useCase.execute(
            username: any(named: 'username'),
            password: any(named: 'password'),
          )).thenAnswer((_) => failureFuture(const LogInFailure.unknown()));
      when(() => navigator.showError(any())).thenAnswer((_) => Future.value());
      await presenter.login();

      verify(() => useCase.execute(
            username: any(named: 'username'),
            password: any(named: 'password'),
          )).called(1);
      verify(() => navigator.showError(any())).called(1);
    },
  );


  // todo add fillInPassword/Username
}
