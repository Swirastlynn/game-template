import 'package:game_template/navigation/app_navigator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations? _appLocalizations;

/// Convenience getter for the app localizations
AppLocalizations get appLocalizations {
  _appLocalizations ??=
      AppLocalizations.of(AppNavigator.navigatorKey.currentContext!)!;
  return _appLocalizations!;
}

//ignore: unused-code
/// Useful method for tests to override app localizations
void overrideAppLocalizations(AppLocalizations localizations) {
  _appLocalizations = localizations;
}
