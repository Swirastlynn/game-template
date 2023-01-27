import 'package:flutter/material.dart';

class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  Future<R?> push<R>(
    Route<R> route, {
    BuildContext? context,
    bool useRoot = false,
  }) async {
    return _navigator(context, useRoot: useRoot).push(route);
  }
}

//ignore: unused-code
Route<T> materialRoute<T>(
  Widget page, {
  bool fullScreenDialog = false,
  String? pageName,
}) =>
    MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(name: pageName ?? page.runtimeType.toString()),
      fullscreenDialog: fullScreenDialog,
    );

NavigatorState _navigator(BuildContext? context, {bool useRoot = false}) =>
    (useRoot || context == null)
        ? AppNavigator.navigatorKey.currentState!
        : Navigator.of(context);
