// input_page.dart
import 'package:bmr/calculator.dart'; // import calculator.dart
import 'package:bmr/component/bottom_button.dart'; // import BottomButton
import 'package:bmr/component/custom_card.dart'; // import CustomCard
import 'package:bmr/component/icon_card.dart'; // import IconCard
import 'package:bmr/component/round_icon_button.dart'; // import RoundIconButton
import 'package:bmr/constants.dart'; // import constants.dart
import 'package:flutter/material.dart'; // import Flutter material package
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // import FontAwesome icons
import 'result_page.dart'; // import Result


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key); 

  @override
  // create state
  State<InputPage> createState() => _InputPageState(); 
}

// enum for
class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male; 
  int height = 170;
  int weight = 65;
  int age = 25; 

  @override
  // build method
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('BMR CALCULATOR')), 
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: [
          // ========== PILIH GENDER ==========
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.male 
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars, 
                      caption: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male; 
                      }); 
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus,
                      caption: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      }); 
                    },
                  ),
                ),
              ],
            ),
          ),

          // ========== INPUT TINGGI ==========
          Expanded(
            child: CustomCard(
              color: activeCardColor, 
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  const Text('HEIGHT', style: labelTextStyle), 
                  Row(
                    // menampilkan nilai tinggi
                    mainAxisAlignment: MainAxisAlignment.center, 
                    crossAxisAlignment: CrossAxisAlignment.baseline, 
                    textBaseline: TextBaseline.alphabetic, 
                    children: [
                      Text(height.toString(), style: numberTextStyle), 
                      const Text('cm', style: labelTextStyle), 
                    ],
                  ),
                  // slider untuk mengatur tinggi
                  Slider(
                    value: height.toDouble(), 
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      }); 
                    },
                  ),
                ],
              ),
            ),
          ),

          // ========== INPUT BERAT & USIA ==========
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        const Text('WEIGHT', style: labelTextStyle), 
                        Text(weight.toString(), style: numberTextStyle), 
                        Row(
                          // tombol minus & plus
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus, 
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) weight--; 
                                });
                              },
                            ),
                            const SizedBox(width: 10.0), 
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++; 
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Usia
                Expanded(
                  child: CustomCard(
                    color: activeCardColor, 
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        const Text('AGE', style: labelTextStyle), 
                        Text(age.toString(), style: numberTextStyle), 
                        Row(
                          // tombol minus & plus
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus, 
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--; 
                                });
                              },
                            ),
                            const SizedBox(width: 10.0), 
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus, 
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ========== TOMBOL HITUNG ==========
          BottomButton(
            buttonTitle: 'CALCULATE BMR',
            onTap: () {
              // Membuat objek kalkulator dan menghitung BMR
              Calculator cal = Calculator(
                height: height,
                weight: weight,
                age: age,
                gender: selectedGender,
              ); // buat objek kalkulator

              String bmr = cal.calculateBMR();// hitung BMR
              String info = cal.getInterpretation();// dapatkan interpretasi

              Navigator.push(// pindah ke halaman hasil
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: 'Your BMR',
                    bmi: bmr,
                    information: info,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
