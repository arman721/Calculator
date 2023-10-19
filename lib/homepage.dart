import 'package:calculator/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final List<String> buttons = [
    'C',
    'DEL',
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
    '^',
    '0',
    '.',
    '=',
  ];
  var input = '';
  var result = '0';

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          centerTitle: true,
          shadowColor: Colors.black12,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    color: Color.fromARGB(255, 81, 80, 80),
                    child: Text(
                      input,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  )),
              SizedBox(
                height: 1,
                child: Container(
                  alignment: Alignment.bottomRight,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(255, 81, 80, 80),
                    child: Text(
                      result,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  )),
              Expanded(
                flex: 10,
                child: Container(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          calculate(buttons[index]);
                        },
                        child: MyButton(
                            color: Color.fromARGB(255, 11, 11, 11),
                            textstyle:
                                TextStyle(color: Colors.white, fontSize: 32),
                            text: buttons[index]),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculate(String op) {
    if (op == "C") {
      setState(() {
        input = "";
        result = '0';
      });
    } else if (op == "DEL") {
      setState(() {
        input = input.substring(0, input.length - 1);
      });
    } else if (op == "=") {
      setState(() {
        String finaluserinput = input;
        finaluserinput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression exp = p.parse(finaluserinput);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        result = eval.toString();
      });
    } else {
      setState(() {
        input += op;
      });
    }
  }
}
