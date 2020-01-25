import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'input_page.dart';
import 'caculator_brain.dart';
class ResultsPage extends StatelessWidget{
  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }
  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }
  ResultsPage({@required this.bmiResult,@required this.texResult, @required this.interpretation});
  final String bmiResult;
  final String texResult;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Center(
                child: Text(
                    'YOUR RESULT',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w600,
                    ),
                ),
              ),
          ),
          Expanded(
            flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF1D1E33),
                ),
                width: screenWidth(context, dividedBy: 1),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30.0,),
                    Text(texResult,style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.green),
                    ),
                    SizedBox(height: 80.0,),
                    Text(
                      bmiResult,
                      style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(height: 80.0,),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,

                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.white,),
                    ),
                  ],
                ),

              ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:80.0,),
                  Text(' RE - CALCULATE',
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