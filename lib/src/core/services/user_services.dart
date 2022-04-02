import 'package:double_v_store/src/core/models/user.dart';

abstract class UserRepository {
  Future<bool> saveUser(User user);
}

class UserServices implements UserRepository {
  @override
  Future<bool> saveUser(User user) async {
    // bool status = false;
    await Future.delayed(const Duration(milliseconds: 300)); //BACKEND REQUEST
    return Future.value(true);
  }
}
