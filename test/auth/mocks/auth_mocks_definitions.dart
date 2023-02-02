import 'package:bloc_test/bloc_test.dart';
import 'package:game_template/auth/domain/log_in_failure.dart';
import 'package:game_template/auth/domain/log_in_use_case.dart';
import 'package:game_template/auth/presentation/login_navigator.dart';
import 'package:game_template/auth/presentation/login_presentation_model.dart';
import 'package:game_template/auth/presentation/login_presenter.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginPresenter extends MockCubit<LoginViewModel>
    implements LoginPresenter {}

class MockLoginPresentationModel extends Mock
    implements LoginPresentationModel {}

class MockLoginNavigator extends Mock implements LoginNavigator {}

class MockLogInFailure extends Mock implements LogInFailure {}

class MockLogInUseCase extends Mock implements LoginUseCase {}
