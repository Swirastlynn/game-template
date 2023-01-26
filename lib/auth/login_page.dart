import 'package:flutter/material.dart';
import 'package:game_template/auth/presentation/login_presentation_model.dart';
import 'package:game_template/auth/presentation/login_presenter.dart';
import 'package:game_template/core/utils/mvp_extensions.dart';

class LoginPage extends StatefulWidget with HasPresenter<LoginPresenter> {
  const LoginPage({
    required this.presenter,
    super.key,
  });

  @override
  final LoginPresenter presenter;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with PresenterStateMixin<LoginViewModel, LoginPresenter, LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "usernameHint", //appLocalizations.usernameHint,
                ),
                onChanged: (text) => presenter.onUsernameChanged(text),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "passwordHint", // appLocalizations.passwordHint,
                ),
                onChanged: (text) => presenter.onPasswordChanged(text),
              ),
              const SizedBox(height: 16),
              stateObserver(
                builder: (context, state) => (state.isLoading)
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: state.isLoginEnabled ? () => presenter.login() : null,
                        child: Text("logInAction"), //appLocalizations.logInAction),
                      ),
              ),
            ],
          ),
        ),
      );
}
