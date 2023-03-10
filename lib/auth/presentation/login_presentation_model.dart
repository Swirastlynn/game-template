import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:game_template/auth/domain/log_in_failure.dart';
import 'package:game_template/core/domain/user.dart';
import 'package:game_template/core/presentation/presentation_model_result.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel extends Equatable implements LoginViewModel {
  const LoginPresentationModel.initial()
      : username = '',
        password = '',
        result = const Result.init();

  /// Used for the copyWith method
  const LoginPresentationModel._({
    required this.username,
    required this.password,
    required this.result,
  });

  final String username;
  final String password;
  final Result<Either<LogInFailure, User>> result;

  @override
  bool get isLoading => result.isPending();

  @override
  bool get areFieldsValidated => username.isNotEmpty && password.isNotEmpty;

  LoginPresentationModel copyWith({
    String? username,
    String? password,
    Result<Either<LogInFailure, User>>? result,
  }) {
    return LoginPresentationModel._(
      username: username ?? this.username,
      password: password ?? this.password,
      result: result ?? this.result,
    );
  }

  // ignore: member-ordering
  @override
  List<Object?> get props => [username, password, result];
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get isLoading;
  bool get areFieldsValidated;
}
