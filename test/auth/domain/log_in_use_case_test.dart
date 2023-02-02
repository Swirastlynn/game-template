import 'package:game_template/auth/domain/log_in_use_case.dart';
import 'package:game_template/core/domain/user.dart';
import 'package:game_template/main.dart';
import 'package:test/test.dart';

import '../../core/mocks/mocks.dart';

void main() {
  isUnitTests = true;
  late LoginUseCase useCase;

  setUp(() {
    Mocks.init();
    useCase = LoginUseCase(Mocks.userStore);
  });

  test('use case - successful execution for correct credentials', () async {
    final user = await useCase.execute(
      username: "abcd",
      password: "pass123",
      onFailure: (fail) {},
      onSuccess: (user) {},
    );

    expect(user, const User(id: 'id_abcd', username: 'abcd'));
  });

  test('use case - failure execution for incorrect credentials', () async {
    final user = await useCase.execute(
      username: "noname",
      password: "password",
      onFailure: (fail) {},
      onSuccess: (user) {},
    );

    expect(user, const User.anonymous());
  });
  test('use case - failure execution for missing credentials', () async {
    final user = await useCase.execute(
      username: "",
      password: "",
      onFailure: (fail) {},
      onSuccess: (user) {},
    );

    expect(user, const User.anonymous());
  });
}