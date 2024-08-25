import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculatorApp/butons.dart';
import 'package:flutter_application_1/calculatorApp/theme/theme.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var userQuestions = '';
  var userAnswer = '';

  bool _userQuestion() {
    if (userQuestions.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.centerRight),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Text(
                      userQuestions,
                      style: TextStyle(fontSize: 20),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: _ButtonString().buttons.length,
                    itemBuilder: (BuildContext, int index) {
                      return _buttonStateManager(index);
                    }),
              )),
        ],
      ),
    );
  }

  MyButtons _buttonStateManager(int index) {
    if (index == 0) {
      return _clearMethod(index);
    } else if (index == 1) {
      return _delMethod(index);
    } else if (index == _ButtonString().buttons.length - 1) {
      return _equalMethod(index);
    }
    return _normalButton(index);
  }

  MyButtons _normalButton(int index) {
    return MyButtons(
        buttonTapped: () {
          setState(() {
            userQuestions += _ButtonString().buttons[index];
          });
        },
        buttonText: _ButtonString().buttons[index],
        color: _isOperator(_ButtonString().buttons[index])
            ? CalculatorColors().buttonColorsOne
            : CalculatorColors().buttonColorsTwo,
        textColor: _isOperator(_ButtonString().buttons[index])
            ? CalculatorColors().buttonTextColorOne
            : CalculatorColors().buttonTextColorTwo);
  }

  MyButtons _equalMethod(int index) {
    return MyButtons(
      buttonText: _ButtonString().buttons[index],
      color: CalculatorColors().buttonColorsOne,
      textColor: CalculatorColors().buttonTextColorOne,
      buttonTapped: () {
        setState(() {
          equalPressed();
        });
      },
    );
  }

  MyButtons _delMethod(int index) {
    return MyButtons(
      buttonText: _ButtonString().buttons[index],
      color: CalculatorColors().delColors,
      textColor: CalculatorColors().buttonTextColorOne,
      buttonTapped: () {
        setState(() {
          _emptyUserQuestions();
        });
      },
    );
  }

  MyButtons _clearMethod(int index) {
    return MyButtons(
      buttonText: _ButtonString().buttons[index],
      buttonTapped: () {
        setState(() {
          userQuestions = '';
          userAnswer = '';
        });
      },
      color: CalculatorColors().clearButtonColor,
      textColor: CalculatorColors().buttonTextColorOne,
    );
  }

  void _emptyUserQuestions() {
    (_userQuestion())
        ? userQuestions = userQuestions.substring(0, userQuestions.length - 1)
        : userQuestions;
  }

  void equalPressed() {
    String finalQuestions = userQuestions;
    finalQuestions = finalQuestions.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestions);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}

class _ButtonString {
  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];
}

bool _isOperator(String x) {
  if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
    return true;
  }
  return false;
}
