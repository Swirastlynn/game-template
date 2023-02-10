import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:game_template/auth/domain/log_in_use_case.dart';
import 'package:game_template/auth/presentation/login_navigator.dart';
import 'package:game_template/auth/presentation/login_presentation_model.dart';
import 'package:game_template/core/utils/future_extensions.dart';
import 'package:game_template/localization/app_localizations_utils.dart';

class LoginPresenter extends Cubit<LoginViewModel> {
  LoginPresenter(
    LoginPresentationModel super.model,
    this.navigator,
    this.useCase,
  );

  final LoginNavigator navigator;
  final LoginUseCase useCase;

  LoginPresentationModel get _model => state as LoginPresentationModel;

  void onUsernameChanged(String username) {
    emit(_model.copyWith(username: username));
  }

  void onPasswordChanged(String password) {
    emit(_model.copyWith(password: password));
  }

  Future<void> login() async {
    await useCase
        .execute(
          username: _model.username,
          password: _model.password,
        )
        .observeStatusChanges((result) => emit(_model.copyWith(result: result)))
        .fold(
      // todo fix formatting
      (fail) {
        navigator.showError(fail.displayableFailure());
      },
      (success) {
        navigator.showAlert(
          title: appLocalizations.commonSuccessTitle,
          message: appLocalizations.commonSuccessMessage,
        );
      },
    );
  }
}
