import 'package:bloc/bloc.dart';
import 'package:game_template/core/domain/user.dart';

class UserStore extends Cubit<User> {
  // todo guarantee singleton in DI
  UserStore(User user) : super(user);

  User get user => state;

  set user(User user) {
    emit(user);
  }
}
