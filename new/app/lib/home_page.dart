import 'package:function_tree/function_tree.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  dynamic res = 0;
  Set<String> signs = {'+', '-', '*', '/', '.', '^'};

  final TextEditingController t = TextEditingController(text: '');

  void doResult() {
    setState(() {
      try {
        res = t.text.interpret();
      } catch (exception) {
        if (t.text.length == 0) res = 0;
      }
    });
  }

  void doJoin(String symbol) {
    setState(() {
      /** replace the last symbol if it's a sign by new sign **/
      if (t.text.length > 0) {
        String sub = t.text.substring(t.text.length - 1, t.text.length);
        for (int i = 0; i < signs.length; i++) {
          if (sub == signs.elementAt(i)) {
            for (int i = 0; i < signs.length; i++) {
              if (symbol == signs.elementAt(i)) {
                t.text = t.text.substring(0, t.text.length - 1);
                break;
              }
            }
            break;
          }
        }
      }
      t.text += symbol;
      doResult();
    });
  }

  void clearOneSymbol() {
    setState(() {
      t.text = t.text.substring(0, t.text.length - 1);
      doResult();
    });
  }

  void doClear() {
    setState(() {
      res = 0;
      t.text = '';
    });
  }

  void onPressedButtom(String symbol) {
    if (symbol == 'AC') {
      doClear();
    } else if (symbol == 'C') {
      clearOneSymbol();
    } else if (symbol == '=') {
      doResult();
    } else {
      doJoin(symbol);
    }
  }

  Widget buildButtom(
      String textButtom, double heightButtom, Color? colorButtom) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Table(
        children: [
          TableRow(
            children: [
              Container(
                height: heightButtom,
                color: colorButtom,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  padding: EdgeInsets.all(16.0),
                  onPressed: () => onPressedButtom(textButtom),
                  child: Text(textButtom,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: TextField(
              textAlign: TextAlign.right,
              keyboardType: TextInputType.number,
              controller: t,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            alignment: Alignment.centerRight,
            child: Text(
              '$res',
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtom('AC', MediaQuery.of(context).size.height * 0.1,
                  Colors.red[200]),
              buildButtom('C', MediaQuery.of(context).size.height * 0.1,
                  Colors.red[200]),
              buildButtom('.', MediaQuery.of(context).size.height * 0.1,
                  Colors.teal[100]),
              buildButtom('/', MediaQuery.of(context).size.height * 0.1,
                  Colors.teal[100]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtom('7', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('8', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('9', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('*', MediaQuery.of(context).size.height * 0.1,
                  Colors.teal[100]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtom('4', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('5', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('6', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('-', MediaQuery.of(context).size.height * 0.1,
                  Colors.teal[100]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtom('1', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('2', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('3', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('+', MediaQuery.of(context).size.height * 0.1,
                  Colors.teal[100]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtom('(', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('0', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom(')', MediaQuery.of(context).size.height * 0.1,
                  Colors.amber[200]),
              buildButtom('=', MediaQuery.of(context).size.height * 0.1,
                  Colors.red[200]),
            ],
          ),
        ],
      ),
    );
  }
}
