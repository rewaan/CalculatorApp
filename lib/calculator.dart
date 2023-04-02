import 'package:calculator_app/calc_button.dart';
import 'package:flutter/material.dart';

/// Main menu screen.
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() => _Calculator();
}

/// Main menu state.
class _Calculator extends State<Calculator> {
  /// Button that start game.
  void addToStack(var function) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.topRight,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Text(
                        "UpText",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  )
                ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.topRight,
                height: MediaQuery.of(context).size.height * 0.15,
                child: const Text(
                  "Text",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[CalcButton(addToStack, '0', '0')],
                )
              ],
            ),
          ],
        ));
  }
}
