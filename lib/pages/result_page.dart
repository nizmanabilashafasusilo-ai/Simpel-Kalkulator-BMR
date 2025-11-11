// result_page.dart
import 'package:bmr/component/bottom_button.dart';// import BottomButton
import 'package:bmr/component/custom_card.dart';// import CustomCard  
import 'package:bmr/constants.dart';// import constants
import 'package:flutter/material.dart';// import Flutter material package
// result page widget
class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.result,
    required this.bmi,
    required this.information,
  });

  final String result;
  final String bmi;
  final String information;

  @override
  // build method
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMR RESULT')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result, style: resultTextStyle),
                  Text(bmi, style: bmiTextStyle),
                  Text('kcal/day', style: labelTextStyle),
                  Text(
                    information,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
