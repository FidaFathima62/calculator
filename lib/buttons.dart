import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color;
  final textcolor;
  final  buttonText;
  final buttontapped;

  MyButton({this.Color,this.textcolor, this.buttonText, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: GestureDetector(
          onTap: buttontapped,
          child: Container(
            height: 50,
            color: Color,
            child: Center(child: Text(buttonText, style: TextStyle(color: textcolor,fontSize: 25,fontWeight: FontWeight.bold),),),
          ),
        ),
      ),
    );
  }
}

