import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:game_template/auth/domain/log_in_failure.dart';
import 'package:game_template/core/domain/user.dart';
import 'package:game_template/core/stores/user_store.dart';
import 'package:game_template/core/utils/either_extensions.dart';
import 'package:game_template/main.dart';

class LoginUseCase {
  LoginUseCase(this._userStore);

  final UserStore _userStore;

  Future<Either<LogInFailure, User>> execute({
    required String username,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      return failure(const LogInFailure.missingCredentials());
    }

    if (!isUnitTests) {
      await Future.delayed(
        Duration(milliseconds: 500 + Random().nextInt(1000)),
      );
    }

    if (username == 'abcd' && password == 'pass123') {
      final user = User(
        id: "id_$username",
        username: username,
      );
      _userStore.user = user;
      return success(user);
    }
    return failure(const LogInFailure.incorrectCredentials());
  }
}
