import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:double_v_store/src/core/constants/app_consts.dart';

class DescriptionOnboardingView extends StatelessWidget {
  const DescriptionOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> descriptionText = AppConsts.informativeConst["DESCRIPTION_TEXT"]!.split(";");

    return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Text(AppConsts.informativeConst["DESCRIPTION"]!,
                      style: TextStyle(color: Colors.blue.shade900, fontSize: size.height * 0.05, fontWeight: FontWeight.bold))),
              Icon(MdiIcons.palmTree, color: Colors.blue, size: size.height * 0.08)
            ],
          ),
          SizedBox(height: size.height * 0.05),
          RichText(
              text: TextSpan(style: TextStyle(color: Colors.black, fontSize: size.height * 0.025), children: [
            TextSpan(text: "${descriptionText[0]} "),
            TextSpan(text: "${descriptionText[1]} ", style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "${descriptionText[2]} "),
            TextSpan(text: descriptionText[3], style: const TextStyle(fontWeight: FontWeight.bold))
          ]))
        ]));
  }
}
