import 'package:flutter/material.dart';
import 'package:game_template/core/domain/displayable_failure.dart';
import 'package:game_template/navigation/app_navigator.dart';
import 'package:mocktail/mocktail.dart';

import '../../auth/mocks/auth_mocks.dart';
import 'mocks_definitions.dart';

class Mocks {
  static late MockAppNavigator appNavigator;
  static late MockUserStore userStore;

  static void init() {
    AuthMocks.init();
    _initMocks();
    _initFallbacks();
  }

  static void _initMocks() {
    appNavigator = MockAppNavigator();
    userStore = MockUserStore();
  }

  static void _initFallbacks() {
    registerFallbackValue(
        DisplayableFailure(title: "fallback title", message: "fallback msg"));
    registerFallbackValue(MockUserStore());
    registerFallbackValue(materialRoute(Container()));
  }
}
