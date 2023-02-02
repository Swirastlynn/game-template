import 'package:game_template/navigation/alert_dialog_route.dart';
import 'package:game_template/navigation/app_navigator.dart';
import 'package:game_template/navigation/error_dialog_route.dart';

class LoginNavigator with AlertDialogRoute, ErrorDialogRoute {
  LoginNavigator(this.appNavigator);

  final AppNavigator appNavigator;
}
