import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextStyle calculatorTextStyle = GoogleFonts.jost(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300);
  RoundedRectangleBorder calculatorButtonClicked = RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white38),
      borderRadius: BorderRadius.circular(15));

  List<bool> isButtonClicked = List.generate(19, (index) => false);
  TextEditingController userInputController = TextEditingController();
  TextEditingController showInputController = TextEditingController();
  double? num1;
  double? num2;
  double? answer;
  String? formattedAnswer;
  bool isAnswered = false;

  void handleContainerTap(String text) {
    setState(() {
      userInputController.text += text;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      userInputController.text = '0';
    });
  }

  List<String> buttonLabels = [
    'c',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '='
  ];

  void performOperation(String operation) {
    setState(() {
      if (operation == 'c') {
        isAnswered = false;
        userInputController.text = '0';
        showInputController.clear();

        //conditionals for zero
      } else if (userInputController.text == '0') {
        if (operation == '/') {
        } else if (operation == '=') {
        } else if (operation == '+/-') {
        } else if (operation == '%') {
        } else if (operation == '/') {
        } else if (operation == 'x') {
        } else if (operation == '-') {
        } else if (operation == '+') {
        } else {
          userInputController.text = operation;
        }
      }

      //conditionals for non zero
      else if (operation == '+/-') {
        if (userInputController.text.startsWith('-')) {
          userInputController.text = userInputController.text.substring(1);
        } else {
          userInputController.text = '-${userInputController.text}';
        }
      } else if (operation == '/') {
        if (isAnswered == false) {
          showInputController.text += userInputController.text + operation;
          num1 = double.parse(userInputController.text);
          print(num1);
          userInputController.text = '0';
          print(isAnswered);
        }
        if (isAnswered == true) {
          showInputController.clear();
          showInputController.text += num1.toString() + operation;
          userInputController.text = '0';
          print(isAnswered);
        }
      } else if (operation == 'x') {
        if (isAnswered == false) {
          showInputController.text += userInputController.text + operation;
          num1 = double.parse(userInputController.text);
          print(num1);
          userInputController.text = '0';
          print(isAnswered);
        }
        if (isAnswered == true) {
          showInputController.clear();
          showInputController.text += num1.toString() + operation;
          userInputController.text = '0';
          print(isAnswered);
        }
      } else if (operation == '-') {
        if (isAnswered == false) {
          showInputController.text += userInputController.text + operation;
          num1 = double.parse(userInputController.text);
          print(num1);
          userInputController.text = '0';
          print(isAnswered);
        }
        if (isAnswered == true) {
          showInputController.clear();
          showInputController.text += num1.toString() + operation;
          userInputController.text = '0';
          print(isAnswered);
        }
      } else if (operation == '+') {
        if (isAnswered == false) {
          showInputController.text += userInputController.text + operation;
          num1 = double.parse(userInputController.text);
          print(num1);
          userInputController.text = '0';
          print(isAnswered);
        }
        if (isAnswered == true) {
          showInputController.clear();
          showInputController.text += num1.toString() + operation;
          userInputController.text = '0';
          print(isAnswered);
        }
      } else if (operation == '%') {
        final num currentValue = double.parse(userInputController.text);
        userInputController.text = (currentValue / 100).toString();
      } else if (operation == '=') {
        showInputController.text += userInputController.text + operation;
        num2 = double.parse(userInputController.text);
        print(num2);

        // Split the input text into segments based on operators
        List<String> segments =
            showInputController.text.split(RegExp(r'[+\-*/]'));

        // Determine the operator used in the input text
        String operator = '';
        if (showInputController.text.contains('+')) {
          operator = '+';
        } else if (showInputController.text.contains('-')) {
          operator = '-';
        } else if (showInputController.text.contains('x')) {
          operator = 'x';
        } else if (showInputController.text.contains('/')) {
          operator = '/';
        }

        // Perform the corresponding operation based on the operator
        switch (operator) {
          case '+':
            answer = (num1! + num2!);
            break;
          case '-':
            answer = (num1! - num2!);
            break;
          case 'x':
            answer = (num1! * num2!);
            break;
          case '/':
            answer = (num1! / num2!);
            break;
          default:
            // Handle any other cases as needed
            break;
        }

        // Determine the number of decimal places for formatting
        int decimalPlaces = (answer! % 1 == 0) ? 1 : 2;
        formattedAnswer = answer?.toStringAsFixed(decimalPlaces);
        userInputController.text = formattedAnswer!;
        isAnswered = true;
        print(isAnswered);
        num1 = double.parse(userInputController.text);
        print(num1);
      } else {
        handleContainerTap(operation);
      }
    });

    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        isButtonClicked[buttonLabels.indexOf(operation)] = false;
      });
    });
  }

  Color getColorForButton(String label) {
    if (label == 'c' || label == '+/-') {
      return const Color(0xFF8A90CB);
    } else if (label == '%' || label == '/') {
      return const Color(0xFF8A90CB);
    } else if (label == 'x' || label == '-' || label == '+' || label == '=') {
      return const Color(0xFFDFA490);
    } else {
      return const Color(0xFF817F99);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF686878),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 270,
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              SizedBox(
                height: 240,
                width: 270,
                child: Card(
                  color: const Color(0xFFF4F4F6),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16, right: 4, left: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFormField(
                          textAlign: TextAlign.right,
                          controller: showInputController,
                          style: GoogleFonts.figtree(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                        TextFormField(
                          textAlign: TextAlign.right,
                          controller: userInputController,
                          style: GoogleFonts.jost(
                            color: Colors.black87,
                            fontSize: 56,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: buttonLabels.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isButtonClicked[index] = true;
                          performOperation(buttonLabels[index]);
                        });
                      },
                      child: SizedBox(
                        child: Card(
                          color: getColorForButton(buttonLabels[index]),
                          elevation: 4,
                          shadowColor: Colors.white24,
                          shape: isButtonClicked[index]
                              ? calculatorButtonClicked
                              : RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(buttonLabels[index],
                                  style: calculatorTextStyle)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
