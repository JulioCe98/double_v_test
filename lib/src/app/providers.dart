import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:double_v_store/src/app/notifiers/user_notifier.dart';

ChangeNotifierProvider<UserNotifier> userNotifierProvider = ChangeNotifierProvider((ref) => UserNotifier());
