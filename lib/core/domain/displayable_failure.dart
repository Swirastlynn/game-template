/// A failure with the title and message that could be easly displayed as a dialog or snackbar
class DisplayableFailure {
  DisplayableFailure({
    required this.title,
    required this.message,
  });

  DisplayableFailure.commonError([String? message])
      : title = "title", //appLocalizations.commonErrorTitle,
        message = message ?? "commonErrorMessage"; // appLocalizations.commonErrorMessage";

  String title;
  String message;
}

abstract class HasDisplayableFailure {
  DisplayableFailure displayableFailure();
}
