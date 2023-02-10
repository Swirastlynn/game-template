import 'package:game_template/core/domain/displayable_failure.dart';
import 'package:game_template/localization/app_localizations_utils.dart';

class LogInFailure implements HasDisplayableFailure {
  const LogInFailure.unknown([this.details]) : type = LogInFailureType.unknown;

  const LogInFailure.missingCredentials([this.details])
      : type = LogInFailureType.missingCredentials;

  const LogInFailure.incorrectCredentials([this.details])
      : type = LogInFailureType.incorrectCredentials;

  final LogInFailureType type;
  final String? details;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case LogInFailureType.unknown:
        return DisplayableFailure.commonError();
      case LogInFailureType.incorrectCredentials:
        return DisplayableFailure(
          title: appLocalizations.incorrectCredsTitle,
          message: appLocalizations.incorrectCredsMessage,
        );
      case LogInFailureType.missingCredentials:
        return DisplayableFailure(
          title: appLocalizations.missingCredsTitle,
          message: appLocalizations.missingCredsMessage,
        );
    }
  }

  @override
  String toString() => 'LogInFailure{type: $type, cause: $details}';
}

enum LogInFailureType {
  unknown,
  incorrectCredentials,
  missingCredentials,
}
