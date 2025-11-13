import 'package:flutter/material.dart';// import flutter material
// round icon button widget
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 40.0, height: 40.0),
      shape: const CircleBorder(),
      fillColor: const Color.fromARGB(255, 15, 97, 156),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
