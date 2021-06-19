import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  dynamic num1 = 0, num2 = 0;
  dynamic res = 0;

  final TextEditingController t1 = TextEditingController(text: '0');
  final TextEditingController t2 = TextEditingController(text: '0');

  void doAdd() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      res = num1 + num2;
    });
  }

  void doSub() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      res = num1 - num2;
    });
  }

  void doMult() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      res = num1 * num2;
    });
  }

  void doDiv() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      if (num2 != 0) {
        res = num1 ~/ num2;
      } else
        res = 'Error';
    });
  }

  void doClear() {
    setState(() {
      num1 = 0;
      num2 = 0;
      t1.text = '0';
      t2.text = '0';
    });
  }

  void getNbr1() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr2() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr3() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr4() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr5() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr6() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr7() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr8() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr9() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void getNbr0() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
    });
  }

  void doPercent() {
    setState(() {
      // num1 = 0;
      // num2 = 0;
      // t1.text = '';
      // t2.text = '';
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
                  color: Colors.indigo),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter Number 1'),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter Number 2'),
              controller: t2,
            ),
            Padding(padding: const EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo, child: Text('+'), onPressed: doAdd),
                MaterialButton(
                    color: Colors.indigo, child: Text('-'), onPressed: doSub),
                MaterialButton(
                    color: Colors.indigo, child: Text('*'), onPressed: doMult),
              ],
            ),
            // Padding(padding: const EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo, child: Text('%'), onPressed: doPercent),
                MaterialButton(
                    color: Colors.indigo, child: Text('/'), onPressed: doDiv),
                MaterialButton(
                    color: Colors.indigo, child: Text(''), onPressed: doDiv),
              ],
            ),
            // Padding(padding: const EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo, child: Text('1'), onPressed: getNbr1),
                MaterialButton(
                    color: Colors.indigo, child: Text('2'), onPressed: getNbr2),
                MaterialButton(
                    color: Colors.indigo, child: Text('3'), onPressed: getNbr3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo, child: Text('4'), onPressed: getNbr4),
                MaterialButton(
                    color: Colors.indigo, child: Text('5'), onPressed: getNbr5),
                MaterialButton(
                    color: Colors.indigo, child: Text('6'), onPressed: getNbr6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo, child: Text('7'), onPressed: getNbr7),
                MaterialButton(
                    color: Colors.indigo, child: Text('8'), onPressed: getNbr8),
                MaterialButton(
                    color: Colors.indigo, child: Text('9'), onPressed: getNbr9),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                    color: Colors.indigo,
                    child: Text('Clear'),
                    onPressed: doClear),
                MaterialButton(
                    color: Colors.indigo, child: Text('0'), onPressed: getNbr0),
                MaterialButton(
                    color: Colors.indigo,
                    child: Text('='),
                    onPressed: () => {}),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem> [
      //     BottomNavigationBarItem (
      //       icon: Icon(Icons.calculate),
      //       label: 'calculate'
      //     )
      //   ]
      // ),
    );
  }
}
