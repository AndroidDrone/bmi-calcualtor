import 'package:bmi_calculator/bmi_result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'utils/constants.dart';
import 'utils/icon_content.dart';
import 'utils/reusable_card_container.dart';
import 'utils/round_icon_button.dart';

enum Gender { MALE, FEMALE }

class BMICalculatorPage extends StatefulWidget {
  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  Gender selectedGender;
  int height = 0;
  int weight = 40;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCardContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    colour: selectedGender == Gender.MALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCardContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    colour: selectedGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCardContainer(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D9E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x15EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 0.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCardContainer(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
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
                Expanded(
                  child: ReusableCardContainer(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMIResultPage()),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.all(10.0),
              height: kBottomContainerHeight,
              child: Center(
                child: Text('Calculate', style: kLageButtonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
