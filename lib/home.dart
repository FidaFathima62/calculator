import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var input='';
  var output='';
  final List<String> buttons=[
   'C' , 'DEL' , '%' , '/' ,
   '9' , '8' , '7' , 'x' ,
   '6' , '5' , '4' , '-' ,
   '3' , '2' , '1' , '+' ,
   '+/-' , '0' , '.' , '=' ,
  ];
   bool isOperator(String x){
    if (x=='%'||x=='/'||x=='x'||x=='-'||x=='+'||x=='='){
      return true;
    }
    return false;
  }
  void equalPressed(){
    String finaluserinput=input;
    finaluserinput=input.replaceAll('x', '*');
    
    Parser p=Parser();
    Expression exp=p.parse(finaluserinput);
    ContextModel cm=ContextModel();
    double eval=exp.evaluate(EvaluationType.REAL, cm);
    output=eval.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(input,style: TextStyle(fontSize: 30,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(15),
                    child: Text(output,style: TextStyle(fontSize: 70,color: Colors.white,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
                itemBuilder: (BuildContext context,int index){
                  
                  if (index==0){
                    return MyButton(
                      buttontapped:() {
                        setState(() {
                          input='';
                          output='0';
                        });
                      },
                      buttonText: buttons[index],
                      Color: Color.fromARGB(255, 33, 33, 33),
                      textcolor: Colors.white,
                    );

                    
                  }else if (index==1){
                    return MyButton(
                      buttontapped: (){
                        setState(() {
                          input=input.substring(0,input.length-1);
                        });
                      
                      }, 
                      buttonText: buttons[index],
                     Color: Color.fromARGB(255, 33, 33, 33),
                      textcolor: Colors.white,
                      );
                  }
                  else if (index==2){
                    return MyButton(
                      buttontapped: (){
                        setState(() {
                          input+=buttons[index]; 
                        });
                      
                      }, 
                      buttonText: buttons[index],
                      Color: Color.fromARGB(255, 33, 33, 33),
                      textcolor: Colors.white,
                      );
                  }
                  else if (index==16){
                    return MyButton(
                      buttonText: buttons[index],
                      Color: Color.fromARGB(255, 73, 73, 73),
                      textcolor: Colors.white,
                      
                      );
                  }
                  else if (index==19){
                    return MyButton(
                      buttontapped: (){
                        setState(() {
                          equalPressed();
                        });
                      
                      },
                      buttonText: buttons[index],
                      Color: Colors.amber,
                      textcolor: Colors.white,
                       );
                  }
                  else {
                  return MyButton(
                    buttontapped: (){
                      setState(() {
                        input+=buttons[index];
                      });
                    },
                    buttonText: buttons[index],
                   Color: isOperator(buttons[index])? Color.fromARGB(255, 33, 33, 33) : Color.fromARGB(255, 73, 73, 73),
                   textcolor: Colors.white,
                  );
                  }
                }),
              ))
        ],
      ),
    );
  }
  
}
