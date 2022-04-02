import 'package:double_v_store/src/core/constants/imgs_consts.dart';
import 'package:double_v_store/src/ui/pages/onboarding/description_onboarding_view.dart';
import 'package:double_v_store/src/ui/pages/onboarding/mision_onboarding_view.dart';
import 'package:double_v_store/src/ui/widgets/sliders/custom_slider.dart';
import 'package:flutter/material.dart';

import 'package:double_v_store/src/ui/widgets/backgrounds/onboarding_background.dart';
import 'package:double_v_store/src/ui/pages/onboarding/initial_onboarding_view.dart';

class OnboardingScreen extends StatefulWidget {
  static String routeName = "onboarding";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageViewController;
  late int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    _pageViewController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: size.width,
                height: size.height,
                child: CustomPaint(
                    painter: OnboardingBackground(),
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.only(top: size.height * 0.05, left: size.width * 0.4, right: size.width * 0.05),
                          child: Image.asset(ImgsConsts.appLogos["LOGO"]!, width: size.width * 0.5)),
                      SizedBox(height: size.height * 0.25),
                      Expanded(
                          child: PageView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _pageViewController,
                              children: const [InitialOnboardingView(), DescriptionOnboardingView(), MisionOnboardingView()])),
                      CustomSliderWidget(currentPage: _currentPage, moveBackward: _moveBackward, moveForward: _moveForward, limit: 2)
                    ])))));
  }

  void _moveForward() {
    _updateCurrentPage("forward");
    _pageViewController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  void _moveBackward() {
    _updateCurrentPage("backward");
    _pageViewController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  void _updateCurrentPage(String action) {
    if (action == "forward") {
      setState(() {
        _currentPage++;
      });
    } else {
      setState(() {
        _currentPage--;
      });
    }
  }
}
