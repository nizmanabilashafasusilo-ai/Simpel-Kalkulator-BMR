import 'package:bmr/constants.dart';// import constants
import 'package:flutter/material.dart';// import flutter material
// icon card widget
class IconCard extends StatelessWidget {
  IconCard({this.cardIcon, required this.caption});

  final IconData? cardIcon;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon, size: 70.0),
        const SizedBox(height: 15.0),
        Text(caption, style: labelTextStyle),
      ],
    );
  }
}
