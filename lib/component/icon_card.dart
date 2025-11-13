import 'package:bmr/constants.dart'; // import constants
import 'package:flutter/material.dart'; // import flutter material

// IconCard widget
class IconCard extends StatelessWidget {
  final IconData? cardIcon;
  final String caption;
  final Color textColor; // warna teks

  const IconCard({
    Key? key,
    required this.cardIcon,
    required this.caption,
    this.textColor = Colors.white, // warna default putih
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon, size: 70.0, color: textColor), // warna ikon ikut teks
        const SizedBox(height: 15.0),
        Text(
          caption,
          style: labelTextStyle.copyWith(color: textColor), // ubah warna teks
        ),
      ],
    );
  }
}
