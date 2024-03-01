import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_icon.dart';
import 'function.dart';
import 'output_screen.dart';

enum Gender {
  male,
  female,
}

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender? selectedGender;
  int weight = 100;
  int age = 17;
  int height = 183;

  Color weightCardColor = inActiveCardColor; // Initial color for weight card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: CustomCard(
                      color: selectedGender == Gender.male
                          ? activeCardColour
                          : Colors.amber.shade900,
                      childWidget: const CustomIcon(
                        icon: (Icons.male),
                        text: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: CustomCard(
                      color: selectedGender == Gender.female
                          ? activeCardColour
                          : Colors.amber.shade900,
                      childWidget: CustomIcon(
                        icon: (Icons.female),
                        text: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: _calculateBackgroundColor(height),
              childWidget: Column(
                children: [
                  Text(
                    "Height",
                    style: TextStyle(
                      fontSize: 18,
                      color: whiteColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    min: 120,
                    max: 220,
                    value: height.toDouble(),
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
          Expanded(
            child: Row(
              children: [
                Expanded(

                  child: CustomCard(
                    color: inActiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            'WEIGHT',style: TextStyle(
                          fontSize: 18,
                          color:whiteColor,
                        )
                        ),
                        Text(
                          weight.toString(),style: TextStyle(
                          fontSize: 50,
                          color:whiteColor,
                        ),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: Icon(Icons.remove,size: 30,color: Colors.white,),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child:  Icon(Icons.add,size: 30,color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(

                  child: CustomCard(
                    color: inActiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            'AGE',style: TextStyle(
                          fontSize: 18,
                          color:whiteColor,
                        )
                        ),
                        Text(
                          age.toString(),style: TextStyle(
                          fontSize: 50,
                          color:whiteColor,
                        ),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {

                                  age--;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: Icon(Icons.remove,size: 30,color: Colors.white,),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child:  Icon(Icons.add,size: 30,color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
          InkWell(
            onTap: () {
              CalculatorBrain cal = CalculatorBrain(height: height, weight: weight);
              final bmi = cal.getCalculatedBMI();
              final text = cal.getResultDetails();
              final details = cal.getResultText();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ResultScreen(
                    text: text,
                    result: bmi,
                    details: details,
                  ),
                ),
              );
            },
            child: Hero(
              tag: "result",
              child: Container(
                height: 80,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEB1455),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _calculateBackgroundColor(int height) {
    const List<int> thresholds = [150, 170, 190];
    const List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
    ];

    for (int i = 0; i < thresholds.length; i++) {
      if (height <= thresholds[i]) {
        return colors[i];
      }
    }
    return Colors.grey;
  }


}
