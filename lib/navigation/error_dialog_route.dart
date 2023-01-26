import 'package:flutter/material.dart';
import 'package:game_template/core/domain/displayable_failure.dart';
import 'package:game_template/navigation/app_navigator.dart';

mixin ErrorDialogRoute {
  Future<void> showError(DisplayableFailure failure, {BuildContext? context}) {
    // todo logError
    return showDialog(
      context: context ?? AppNavigator.navigatorKey.currentContext!,
      builder: (context) => ErrorDialog(failure: failure),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.failure,
    super.key,
  });

  final DisplayableFailure failure;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(failure.title),
      content: Text(failure.message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("okAction"), //appLocalizations.okAction),
        ),
      ],
    );
  }
}
