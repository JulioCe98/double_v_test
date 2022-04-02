import 'package:flutter/material.dart';

import 'package:double_v_store/src/core/constants/app_consts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InitialOnboardingView extends StatelessWidget {
  const InitialOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [
      Text(AppConsts.informativeConst["WELCOME_TO"]!, style: TextStyle(fontSize: size.height * 0.03, fontWeight: FontWeight.bold)),
      Text(AppConsts.informativeConst["COMPANY_NAME"]!,
          style: TextStyle(color: Colors.blue.shade900, fontSize: size.height * 0.05, fontWeight: FontWeight.bold)),
      Icon(MdiIcons.palmTree, size: size.height * 0.3, color: Colors.blue)
    ]);
  }
}
