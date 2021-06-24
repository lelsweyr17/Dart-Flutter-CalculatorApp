import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultiPageApp',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar (
        title: Text('test'),
        centerTitle: true,
        backgroundColor: Colors.black45
      ),
      body: SafeArea (
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column (
              children: [
                Padding(padding: EdgeInsets.only(top: 30)),
                Text("qwe", style: TextStyle(fontSize: 25, color: Colors.white)),
                Padding(padding: EdgeInsets.only(top: 10)),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/kitty.jpeg'),
                  radius: 50
              ),
              Row (
                children: [
                  Icon(Icons.mail_outline, size: 25),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text('Count = $_count', style: TextStyle(color: Colors.white))
                ],
              )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton (
        child: Icon(Icons.ac_unit_outlined),
        backgroundColor: Colors.amber,
        onPressed: () {
          setState(() {
            _count++;
          });
        }
      ),
    );
  }
}