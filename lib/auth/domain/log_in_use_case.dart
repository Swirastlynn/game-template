import 'dart:math';

import 'package:game_template/auth/domain/log_in_failure.dart';
import 'package:game_template/core/domain/user.dart';
import 'package:game_template/core/stores/user_store.dart';
import 'package:game_template/main.dart';

class LoginUseCase {
  LoginUseCase(this._userStore);

  final UserStore _userStore;

  Future<User> execute({
    required String username,
    required String password,
    required void Function(LogInFailure fail) onFailure,
    required void Function(User user) onSuccess,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      onFailure(const LogInFailure.missingCredentials());
      return const User.anonymous();
    }

    if (!isUnitTests) {
      await Future.delayed(Duration(milliseconds: 500 + Random().nextInt(1000)));
    }

    if (username == 'abcd' && password == 'pass123') {
      final user = User(
        id: "id_$username",
        username: username,
      );
      _userStore.user = user;
      onSuccess(user);
      return user;
    }
    onFailure(const LogInFailure.unknown());
    return const User.anonymous();
  }
}
