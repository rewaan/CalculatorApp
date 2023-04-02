import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  Function onClickedFunction;
  String function;
  String buttonText;

  CalcButton(this.onClickedFunction, this.function, this.buttonText,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width * 0.333,
          height: MediaQuery.of(context).size.height * 0.13),
      child: ElevatedButton(
        onPressed: () {
          onClickedFunction(function);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(function,
        style: const TextStyle(color: Colors.black),),
      ),
    );
  }
}
