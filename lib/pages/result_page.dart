import 'package:bmr/component/bottom_button.dart'; // import BottomButton
import 'package:bmr/component/custom_card.dart'; // import CustomCard
import 'package:bmr/constants.dart'; // import constants
import 'package:flutter/material.dart'; // import Flutter material package

// result page widget
class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.result,
    required this.bmi,
    required this.information,
    required this.gender, //Tambahkan parameter gender
  }) : super(key: key);

  final String result;
  final String bmi;
  final String information;
  final String gender; //Tambahkan variabel gender

  @override
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
              alignment: Alignment.center,
              child: const Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
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
                  Text(
                    'Gender: $gender',
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(result, style: resultTextStyle),
                  Text(bmi, style: bmiTextStyle),
                  const Text('kcal/day', style: labelTextStyle),
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
