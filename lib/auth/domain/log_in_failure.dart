import 'package:game_template/core/domain/displayable_failure.dart';

class LogInFailure implements HasDisplayableFailure {
  const LogInFailure.unknown([this.details]) : type = LogInFailureType.unknown;

  const LogInFailure.missingCredentials([this.details]) : type = LogInFailureType.missingCredentials;

  final LogInFailureType type;
  final String? details;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case LogInFailureType.unknown:
        return DisplayableFailure.commonError();
      case LogInFailureType.missingCredentials:
        return DisplayableFailure(
          title: "missingCredsTitle", //appLocalizations.missingCredsTitle,
          message: "missingCredsMessage", //appLocalizations.missingCredsMessage,
        );
    }
  }

  @override
  String toString() => 'LogInFailure{type: $type, cause: $details}';
}

enum LogInFailureType {
  unknown,
  missingCredentials,
}
