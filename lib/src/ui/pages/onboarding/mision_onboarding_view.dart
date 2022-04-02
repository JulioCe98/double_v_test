import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:double_v_store/src/ui/screens/auth/auth_screen.dart';
import 'package:double_v_store/src/core/constants/app_consts.dart';

class MisionOnboardingView extends StatelessWidget {
  const MisionOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> descriptionText = AppConsts.informativeConst["MISION_TEXT"]!.split(";");

    return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(children: [
          Row(children: [
            Icon(MdiIcons.earth, color: Colors.blue, size: size.height * 0.08),
            SizedBox(width: size.width * 0.03),
            Expanded(
                child: Text(AppConsts.informativeConst["MISION"]!,
                    style: TextStyle(color: Colors.blue.shade900, fontSize: size.height * 0.05, fontWeight: FontWeight.bold)))
          ]),
          SizedBox(height: size.height * 0.05),
          RichText(
              text: TextSpan(style: TextStyle(color: Colors.black, fontSize: size.height * 0.025), children: [
            TextSpan(text: "${descriptionText[0]} "),
            TextSpan(text: "${descriptionText[1]} ", style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "${descriptionText[2]} "),
            TextSpan(text: descriptionText[3], style: const TextStyle(fontWeight: FontWeight.bold))
          ])),
          SizedBox(height: size.height * 0.03),
          TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AuthScreen.routeName),
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    AppConsts.buttonConst["GO"]!,
                    style: const TextStyle(color: Colors.white),
                  )))
        ]));
  }
}
