import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  String operand = "";
  double num1 = 0.0;
  double num2 = 0.0;

  operation(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      debugPrint("pressed C");
      num1 = 0.0;
      num2 = 0.0;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }

      if (operand == "-") {
        _output = (num1 - num2).toString();
      }

      if (operand == "x") {
        _output = (num1 * num2).toString();
      }

      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }

    else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String ButtonText) {
    return Expanded(
        child: RawMaterialButton(
      onPressed: () {
        operation(ButtonText);
      },
      child: Text(
        "$ButtonText",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: Border.all(color: Colors.black),
      padding: EdgeInsets.all(30),
      splashColor: Colors.white54,
      fillColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("CALCULATOR"),
          leading: Icon(
            Icons.calculate_outlined,
            size: 36,
          ),
          backgroundColor: Colors.red,
        ),
        body: Container(
          // margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    "$output",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 60),
                  ),
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    color: Colors.white60,
                  ),
                ),
              ),
              Row(
                children: [
                  button("7"),
                  SizedBox(
                    width: 4,
                  ),
                  button("8"),
                  SizedBox(
                    width: 4,
                  ),
                  button("9"),
                  SizedBox(
                    width: 4,
                  ),
                  button("x"),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  button("4"),
                  SizedBox(
                    width: 4,
                  ),
                  button(
                    "5",
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  button("6"),
                  SizedBox(
                    width: 4,
                  ),
                  button("-"),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  button("1"),
                  SizedBox(
                    width: 4,
                  ),
                  button("2"),
                  SizedBox(
                    width: 4,
                  ),
                  button("3"),
                  SizedBox(
                    width: 4,
                  ),
                  button("+"),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  button("0"),
                  SizedBox(
                    width: 4,
                  ),
                  button("C"),
                  SizedBox(
                    width: 4,
                  ),
                  button("/"),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  button("="),
                  SizedBox(
                    width: 4,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
