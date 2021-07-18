import 'package:function_tree/function_tree.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic res = 0;
  Set<String> signs = {'+', '-', '×', '/', '.', '^'};

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
        if (signs.contains(sub) && signs.contains(symbol))
          t.text = t.text.substring(0, t.text.length - 1);
      }
      t.text += symbol;
      doResult();
    });
  }

  void clearOneSymbol() {
    setState(() {
      try {
        t.text = t.text.substring(0, t.text.length - 1);
      } catch (exception) {
        t.text = '';
      }
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
      width: MediaQuery.of(context).size.width * 0.23,
      child: Table(
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: heightButtom,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: colorButtom,
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
        title: Text('CALCULATOR',
            style: TextStyle(
                color: Colors.red[300],
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 22.0, left: 22.0, right: 22.0),
            child: ClipPath(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    controller: t,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  shape: BoxShape.rectangle,
                ),
              ),
              clipper: CustomClipPath(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Container(height: 15, color: Colors.red[200]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Container(height: 20, color: Colors.amber[200]),
          ),
          // Container(
          //   alignment: Alignment.centerRight,
          //   padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          //   child: TextField(
          //     textAlign: TextAlign.right,
          //     keyboardType: TextInputType.number,
          //     controller: t,
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          //   alignment: Alignment.centerRight,
          //   child: Text(
          //     '$res',
          //     style: TextStyle(
          //         fontSize: 38,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.amber),
          //   ),
          // ),
          Expanded(child: SizedBox()),
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
              buildButtom('×', MediaQuery.of(context).size.height * 0.1,
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
          SizedBox(height: 12.0),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 65);
    path.lineTo(65, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
