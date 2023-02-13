import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_template/auth/login_page.dart';
import 'package:game_template/auth/presentation/login_presentation_model.dart';
import 'package:game_template/auth/presentation/login_presenter.dart';

// todo upgrade to BlocProvider and observe how it changes the code and tests
class LoginPageConnector extends StatefulWidget {
  //with HasPresenter<LoginPresenter> {
  const LoginPageConnector({super.key, required this.presenter});

  // @override
  final LoginPresenter presenter;

  @override
  State<LoginPageConnector> createState() => _LoginPageConnectorState();
}

class _LoginPageConnectorState extends State<LoginPageConnector> {
  @override
  void dispose() {
    widget.presenter.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPresenter, LoginViewModel>(
      bloc: widget.presenter,
      builder: (context, state) {
        return Scaffold(
          body: LoginPage(
            fillInUsername: (String username) {
              widget.presenter.fillInUsername(username);
            },
            fillInPassword: (String password) {
              widget.presenter.fillInPassword(password);
            },
            login: () {
              widget.presenter.login();
            },
            isLoading: state.isLoading,
            areFieldsValidated: state.areFieldsValidated,
          ),
        );
      },
    );
  }
}
