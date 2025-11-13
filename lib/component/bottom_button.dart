import 'package:bmr/constants.dart';// import constants
import 'package:flutter/material.dart';// import flutter material

// bottom button widget
class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {//
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        // width: double.infinity,
        height: bottomContainerHeight,
        color: const Color.fromARGB(255, 56, 72, 139),
        child: Center(child: Text(buttonTitle, style: buttonTextStyle)),
      ),
    );
  }
}
