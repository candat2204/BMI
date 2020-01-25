import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_action_button.dart';
import 'caculator_brain.dart';
import 'results_page.dart';
const inactiveCardColour = Color(0xFF111328);
const activeCardColour = Color(0xFF1D1E33);
enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget{
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage>{
  Gender selectedGender;
  int height = 170;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded( child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,
                  carChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    lable: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
                  carChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    lable: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(
              colour: inactiveCardColour ,
              carChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[

                      Text(height.toString(), style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text('cm', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 10.0,
                      max: 250.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      })
                ],

              ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  carChild: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:20.0),),
                      Text(
                        weight.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:50.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 15.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                          )
                        ],
                      ),
                    ],
                  ),
              )
              ),
              Expanded(child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                carChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:20.0),),
                    Text(
                      age.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:50.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 15.0,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
                )
              ),
            ],
          )),
          GestureDetector(
            onTap: (){

              CalculatorBrain cal = CalculatorBrain(height: height, weight: weight);


              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: cal.caculateBMI(),
                texResult: cal.getResult(),
                interpretation: cal.getInterpretation(),
              )));
            },
            child: Container(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:80.0,),
                  Text('CALCULATE',
                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFFEB1555),

                borderRadius: BorderRadius.circular(10.0),
              ),

            ),
          ),
        ],
      ),
    );
  }
}



