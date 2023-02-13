import 'package:flutter/material.dart';
import 'package:game_template/localization/app_localizations_utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    required this.fillInUsername,
    required this.fillInPassword,
    required this.login,
    required this.isLoading,
    required this.areFieldsValidated,
    super.key,
  });

  final void Function(String username) fillInUsername;
  final void Function(String password) fillInPassword;
  final void Function() login;
  final bool isLoading;
  final bool areFieldsValidated;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: appLocalizations.usernameHint,
            ),
            onChanged: (text) => fillInUsername(text),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: appLocalizations.passwordHint,
            ),
            onChanged: (text) => fillInPassword(text),
          ),
          const SizedBox(height: 16),
          (isLoading)
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  key: const Key("logIn"),
                  onPressed: areFieldsValidated ? () => login() : null,
                  child: Text(appLocalizations.logInAction),
                ),
        ],
      ),
    );
  }
}
