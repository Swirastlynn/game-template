import 'package:game_template/core/domain/user.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial()
      : username = '',
        password = '',
        isPending = false,
        user = const User.anonymous();

  /// Used for the copyWith method
  LoginPresentationModel._({
    required this.username,
    required this.password,
    required this.isPending,
    required this.user,
  });

  final String username;
  final String password;
  final bool isPending;
  final User user; // result

  @override
  bool get isLoading => isPending;

  @override
  bool get isLoginEnabled => username.isNotEmpty && password.isNotEmpty;

  LoginPresentationModel copyWith({
    String? username,
    String? password,
    bool? isPending,
    User? user,
  }) {
    return LoginPresentationModel._(
      username: username ?? this.username,
      password: password ?? this.password,
      isPending: isPending ?? this.isPending,
      user: user ?? this.user,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get isLoading;
  bool get isLoginEnabled;
}
