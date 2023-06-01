import 'package:calculator_app/calc_button.dart';
import 'package:calculator_app/calc_types.dart';
import 'package:flutter/material.dart';

/// Main menu screen.
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  List<String> stack = [];
  List<CalcTypes> typesStack = [];
  List<int> calcIndexes = [];
  String actualVal = '';

  int getFirstNumber(int index) {
    int indexOfCalc = calcIndexes.indexOf(index);
    if (indexOfCalc == 0) {
      int number = int.parse(stack.sublist(0, index).join());
      return number;
    }
    return int.parse(
        stack.sublist(calcIndexes.indexOf(index - 1), index).join());
  }

  int getSecondNumber(int index) {
    int indexOfCalc = calcIndexes.indexOf(index);
    if (indexOfCalc == calcIndexes.length - 1) {
      return int.parse(
          stack.sublist(index+1, stack.length).join());
    }
    int number = int.parse(
        stack.sublist(index+1, calcIndexes.indexOf(index + 1)).join());
    return number;
  }

  void calculateResult() {
    for (int i = 0; i < typesStack.length; i++) {
      if (typesStack[i] == CalcTypes.number) {
        continue;
      }
      int firstNumber = getFirstNumber(i);
      int secondNumber = getSecondNumber(i);
      switch (typesStack[i]) {
        case CalcTypes.add:
          actualVal = (firstNumber + secondNumber).toString();
          break;
        case CalcTypes.sub:
          actualVal = (firstNumber - secondNumber).toString();
          break;
        case CalcTypes.mul:
          actualVal = (firstNumber * secondNumber).toString();
          break;
        case CalcTypes.div:
          actualVal = (firstNumber / secondNumber).toString();
          break;
      }
    }
  }

  void addToStack(var function, var value, CalcTypes type) {
    if (type == CalcTypes.clear) {
      stack.clear();
      typesStack.clear();
      actualVal = '';
      calcIndexes.clear();
      setState(() {});
      return;
    } else if (type == CalcTypes.result) {
      calculateResult();
      setState(() {});
      typesStack.clear();
      stack.clear();
      calcIndexes.clear();
      return;
    }
    if (typesStack.isNotEmpty && typesStack.last != CalcTypes.number) {
      actualVal = '';
      if (type != CalcTypes.number) {
        stack.last = value.toString();
        typesStack.last = type;
        actualVal = stack.last;
        setState(() {});
        return;
      }
      calcIndexes.add(typesStack.length - 1);
    }
    stack.add(function);
    typesStack.add(type);
    if (typesStack.isEmpty || typesStack.last != CalcTypes.number) {
      actualVal = value.toString();
      setState(() {});
      return;
    }
    actualVal = '$actualVal$value';
    setState(() {});
  }

  String calculationValues() {
    return stack.join();
  }

  String lastValueOnStack() {
    return actualVal.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.topRight,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Text(
                    calculationValues(),
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.topRight,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text(
                  lastValueOnStack(),
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
            ]),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '0', '0', CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '0', '0', CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, 'C', 'C', CalcTypes.clear)
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '9', 9, CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '8', 8, CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '-', '-', CalcTypes.sub)
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '7', 7, CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '6', 6, CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '+', '+', CalcTypes.add)
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '5', 5, CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '4', 4, CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '*', '*', CalcTypes.mul)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '3', 3, CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '2', 2, CalcTypes.number)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalcButton(addToStack, '/', '/', CalcTypes.div)
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CalcButton(addToStack, '1', 1, CalcTypes.number)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CalcButton(addToStack, '0', 0, CalcTypes.number)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CalcButton(addToStack, '=', '=', CalcTypes.result)
                        ],
                      ),
                    ]))
          ],
        ));
  }
}
