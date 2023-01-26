import 'package:game_template/core/domain/user.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial()
      : user = const User.anonymous(),
        isPending = false,
        username = '',
        password = '';

  /// Used for the copyWith method
  LoginPresentationModel._({
    required this.user,
    required this.isPending,
    required this.username,
    required this.password,
  });

  final User user;
  final bool isPending;
  final String username;
  final String password;

  @override
  bool get isLoading => isPending;

  @override
  bool get isLoginEnabled => username.isNotEmpty && password.isNotEmpty;

  LoginPresentationModel copyWith({
    User? loginResult,
    bool? isPending,
    String? username,
    String? password,
  }) {
    return LoginPresentationModel._(
      user: loginResult ?? this.user,
      isPending: isPending ?? this.isPending,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get isLoading;
  bool get isLoginEnabled;
}
