import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_template/auth/login_page.dart';
import 'package:game_template/localization/app_localizations_utils.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import '../../../core/mocks/mocks.dart';
import '../../../core/test_utils.dart';

/// test description template: GIVEN assumption WHEN condition THEN expected result
/// Describe on behavior level of abstraction, not code level of abstraction.
/// Keep behavior chronological order, but only if possible.
void main() {
  setUp(() {
    Mocks.init();
    overrideAppLocalizations(AppLocalizationsEn());
  });

  tearDown(() {
    resetMocktailState();
  });

  testWidgets('WHEN initialized THEN disabled login button', (tester) async {
    await tester.loadWidget(
      widget: LoginPage(
        fillInUsername: (_) {},
        fillInPassword: (_) {},
        login: () {},
        isLoading: false,
        areFieldsValidated: false,
      ),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(
        tester.widget<ElevatedButton>(find.byKey(const Key("logIn"))).enabled,
        isFalse);
  });

  testWidgets('WHEN fields validated THEN page ready to log in',
      (tester) async {
    await tester.loadWidget(
      widget: LoginPage(
        fillInUsername: (_) {},
        fillInPassword: (_) {},
        login: () {},
        isLoading: false,
        areFieldsValidated: true,
      ),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(
        tester.widget<ElevatedButton>(find.byKey(const Key("logIn"))).enabled,
        isTrue);
  });

  testWidgets('WHEN loading THEN no login button and progress indicator',
      (tester) async {
    await tester.loadWidget(
      widget: LoginPage(
        fillInUsername: (_) {},
        fillInPassword: (_) {},
        login: () {},
        isLoading: true,
        areFieldsValidated: true,
      ),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byKey(const Key("logIn")), findsNothing);
  });
}
