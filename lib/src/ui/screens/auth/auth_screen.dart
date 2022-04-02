import 'package:flutter/material.dart';

import 'package:double_v_store/src/core/constants/app_consts.dart';
import 'package:double_v_store/src/ui/widgets/backgrounds/auth_background.dart';
import 'package:double_v_store/src/ui/pages/auth/sing_in_view.dart';
import 'package:double_v_store/src/ui/pages/auth/sing_up_view.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = "auth";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late int _currentView;

  @override
  void initState() {
    _currentView = 0;
    super.initState();
  }

  void changePage(int page) {
    setState(() {
      _currentView = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: CustomPaint(
                    painter: AuthBackground(),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Container(
                              margin: EdgeInsets.only(top: size.height * 0.08),
                              child: _currentView == 0
                                  ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text(AppConsts.informativeConst["WELCOME"]!,
                                          style: TextStyle(color: Colors.white, fontSize: size.height * 0.03)),
                                      Text(AppConsts.informativeConst["LOGIN"]!,
                                          style: TextStyle(color: Colors.white, fontSize: size.height * 0.07, fontWeight: FontWeight.bold))
                                    ])
                                  : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text(AppConsts.informativeConst["HELLO"]!, style: TextStyle(color: Colors.white, fontSize: size.height * 0.03)),
                                      Text("${AppConsts.buttonConst["SINGUP"]!}!",
                                          style: TextStyle(color: Colors.white, fontSize: size.height * 0.06, fontWeight: FontWeight.bold))
                                    ])),
                          Expanded(child: _currentView == 0 ? SingInFormWidget(changePage: changePage) : SingUpFormWidget(changePage: changePage))
                        ]))))));
  }
}
