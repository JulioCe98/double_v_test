import 'package:flutter/material.dart';

import 'package:double_v_store/src/ui/widgets/forms/custom_text_form_field.dart';
import 'package:double_v_store/src/core/constants/app_consts.dart';

class SingInFormWidget extends StatelessWidget {
  final Function changePage;
  const SingInFormWidget({Key? key, required this.changePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(top: size.height * 0.25),
        width: double.infinity,
        child: Form(
            child: Column(children: [
          CustomTextFormFieldWidget(
              title: AppConsts.informativeConst["EMAIL"]!,
              hint: AppConsts.informativeConst["EMAIL_HINT"]!,
              icon: Icons.alternate_email,
              rounded: true),
          SizedBox(height: size.height * 0.02),
          Column(children: [
            CustomTextFormFieldWidget(
                title: AppConsts.informativeConst["PASSWORD"]!,
                hint: AppConsts.informativeConst["PASSWORD_HINT"]!,
                icon: Icons.lock,
                rounded: true,
                obscureText: true),
            Row(children: [
              Expanded(
                  child: Row(children: [
                const Checkbox(value: false, onChanged: null),
                Expanded(
                    child: Text(AppConsts.informativeConst["REMEMBER_PASSWORD"]!, style: TextStyle(color: Colors.grey, fontSize: size.width * 0.035)))
              ])),
              Expanded(
                  child: Text(AppConsts.informativeConst["FORGET_PASSWORD"]!,
                      textAlign: TextAlign.end, style: TextStyle(color: Colors.black, fontSize: size.width * 0.035)))
            ])
          ]),
          SizedBox(height: size.height * 0.03),
          TextButton(
              onPressed: null,
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Text(
                  AppConsts.buttonConst["LOGIN"]!,
                  style: const TextStyle(color: Colors.white),
                ),
              )),
          GestureDetector(
              onTap: () => changePage(1),
              child: RichText(
                  text: TextSpan(style: TextStyle(color: Colors.black, fontSize: size.width * 0.035), children: [
                TextSpan(text: "${AppConsts.informativeConst["NO_ACCOUNT"]!} "),
                TextSpan(
                    text: AppConsts.buttonConst["SINGUP"]!, style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
              ])))
        ])));
  }
}
