import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:double_v_store/src/app.dart';
import 'package:double_v_store/src/app/dependency_injector.dart';

void main() async {
  await setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}
