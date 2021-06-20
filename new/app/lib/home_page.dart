import 'package:function_tree/function_tree.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  num res = 0;
  String sub = '';
  Set<String> signs = {'+', '-', '*', '/', '.', '%', '^'};

  final TextEditingController t = TextEditingController(text: '');

  void doResult() {
    setState(() {
      if (t.text.length > 0) {
        sub = t.text.substring(t.text.length - 1, t.text.length);
        for (int i = 0; i < signs.length; i++) {
          if (sub == signs.elementAt(i)) {
            sub = t.text.substring(0, t.text.length - 1);
            res = sub.interpret();
            break;
          } else if (i == signs.length - 1) {
            res = t.text.interpret();
          }
        }
      }
    });
  }

  void doJoin(String symbol) {
    setState(() {
      /* replace the last symbol if it's a sign by new sign */
      if (t.text.length > 0) {
        sub = t.text.substring(t.text.length - 1, t.text.length);
        for (int i = 0; i < signs.length; i++) {
          if (sub == signs.elementAt(i)) {
            for (int i = 0; i < signs.length; i++) {
              if (symbol == signs.elementAt(i)) {
                print('sub: $sub');
                print('t.text: $t.text');
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

  void doClear() {
    setState(() {
      res = 0;
      t.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'Output : $res',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.indigo[200]),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter Number 1'),
              controller: t,
            ),
            Padding(padding: const EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('^'),
                    onPressed: () => doJoin('^')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('('),
                    onPressed: () => doJoin('(')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text(')'),
                    onPressed: () => doJoin(')')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('+'),
                    onPressed: () => doJoin('+')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('-'),
                    onPressed: () => doJoin('-')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('*'),
                    onPressed: () => doJoin('*')),
              ],
            ),
            // Padding(padding: const EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('%'),
                    onPressed: () => doJoin('%')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('/'),
                    onPressed: () => doJoin('/')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('.'),
                    onPressed: () => doJoin('.')),
              ],
            ),
            // Padding(padding: const EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('1'),
                    onPressed: () => doJoin('1')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('2'),
                    onPressed: () => doJoin('2')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('3'),
                    onPressed: () => doJoin('3')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('4'),
                    onPressed: () => doJoin('4')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('5'),
                    onPressed: () => doJoin('5')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('6'),
                    onPressed: () => doJoin('6')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('7'),
                    onPressed: () => doJoin('7')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('8'),
                    onPressed: () => doJoin('8')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('9'),
                    onPressed: () => doJoin('9')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('Clear'),
                    onPressed: doClear),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('0'),
                    onPressed: () => doJoin('0')),
                MaterialButton(
                    color: Colors.indigo[200],
                    child: Text('='),
                    onPressed: doResult),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
