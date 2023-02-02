import 'package:bloc_test/bloc_test.dart';
import 'package:game_template/core/domain/user.dart';
import 'package:game_template/core/stores/user_store.dart';
import 'package:game_template/navigation/app_navigator.dart';
import 'package:mocktail/mocktail.dart';

class MockAppNavigator extends Mock implements AppNavigator {}

class MockUserStore extends MockCubit<User> implements UserStore {}
