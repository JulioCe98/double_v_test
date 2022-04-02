import 'package:flutter/material.dart';

class CustomSliderWidget extends StatelessWidget {
  final int currentPage;
  final int limit;
  final Function moveBackward;
  final Function moveForward;

  const CustomSliderWidget({Key? key, required this.currentPage, required this.moveBackward, required this.moveForward, required this.limit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        margin: EdgeInsets.only(bottom: size.height * 0.05),
        child: Row(
            mainAxisAlignment: currentPage == 0
                ? MainAxisAlignment.end
                : currentPage == limit
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
            children: [
              if (currentPage > 0) TextButton(onPressed: () => moveBackward(), child: Icon(Icons.arrow_back, size: size.width * 0.1)),
              if (currentPage < limit) TextButton(onPressed: () => moveForward(), child: Icon(Icons.arrow_forward, size: size.width * 0.1))
            ]));
  }
}
