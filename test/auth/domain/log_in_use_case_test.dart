import 'package:game_template/auth/domain/log_in_failure.dart';
import 'package:game_template/auth/domain/log_in_use_case.dart';
import 'package:game_template/core/domain/user.dart';
import 'package:game_template/core/utils/either_extensions.dart';
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
    final result = await useCase.execute(
      username: "abcd",
      password: "pass123",
    );

    expect(result.getSuccess(), const User(id: 'id_abcd', username: 'abcd'));
  });

  test('use case - failure execution for incorrect credentials', () async {
    final result = await useCase.execute(
      username: "noname",
      password: "password",
    );

    expect(result.getFailure(), const LogInFailure.incorrectCredentials());
  });
  test('use case - failure execution for missing credentials', () async {
    final result = await useCase.execute(
      username: "",
      password: "",
    );

    expect(result.getFailure(), const LogInFailure.missingCredentials());
  });
}
