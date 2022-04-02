import 'package:get_it/get_it.dart';

import 'package:double_v_store/src/core/services/user_services.dart';

// This is our global ServiceLocator
GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<UserServices>(UserServices());
}
