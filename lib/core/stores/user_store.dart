import 'package:bloc/bloc.dart';
import 'package:game_template/core/domain/user.dart';

class UserStore extends Cubit<User> {
  UserStore({User? user}) : super(user ?? const User.anonymous());

  User get user => state;

  set user(User user) {
    emit(user);
  }
}
