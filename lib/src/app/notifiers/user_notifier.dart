import 'package:flutter/material.dart';

import 'package:double_v_store/src/core/models/user.dart';
import 'package:double_v_store/src/app/dependency_injector.dart';
import 'package:double_v_store/src/core/services/user_services.dart';

class UserNotifier extends ChangeNotifier {
  final User _user = User.empty();

  User get user => _user;

  Future<bool> saveUser() async {
    bool status = false;
    status = await locator<UserServices>().saveUser(user);
    return status;
  }
}
