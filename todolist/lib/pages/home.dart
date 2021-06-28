import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [];
  String _userToDo = '';
  List<bool> _isVisible = [];
  List<bool> _isDone = [];

  void confirmDelete(int index) {
    setState(() {
      _isVisible[index] = false;
    });
    final snackBar = SnackBar(
        content: Text('Element is deleted'),
        action: SnackBarAction(
            label: 'Cancel',
            onPressed: () {
              setState(() {
                _isVisible[index] = true;
              });
            }),
        duration: Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (_isVisible[index] == false) toDoList.remove(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: new Container(
          child: Center(
              child: Text('TO DO',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: [Colors.lime, Colors.teal]),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 60.0),
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget> [
            new DrawerHeader(child: new Text('TO DO', style: TextStyle(fontWeight: FontWeight.bold)), padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0)),
            new ListTile(
              title: new Text('First Menu Item'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Second Menu Item'),
              onTap: () {},
            ),
            new Divider(),
            new ListTile(
              title: new Text('About'),
              onTap: () {},
            ),
          ],
        )
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            behavior: HitTestBehavior.translucent,
            background: Container(
              color: Colors.green[600],
              width: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.archive, color: Colors.black54, size: 30)
                    ]),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red[600],
              width: 20.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(Icons.delete_forever, color: Colors.black54, size: 30)
                ]),
              ),
            ),
            movementDuration: const Duration(milliseconds: 500),
            key: Key(toDoList[index]),
            child: Column(
              children: [
                Visibility(
                  visible: _isVisible[index],
                  child: Card(
                    child: ListTile(
                      title: Text(toDoList[index]),
                      leading: IconButton(
                          icon: (_isDone[index] == false
                              ? Icon(Icons.check_box_outline_blank_outlined)
                              : Icon(Icons.check_box, color: Colors.green)),
                          onPressed: () {
                            setState(() {
                              _isDone[index] = !_isDone[index];
                            });
                          }),
                      trailing: IconButton(
                          icon: Icon(Icons.delete_outlined,
                              color: Colors.red[600]),
                          onPressed: () {
                            confirmDelete(index);
                          }),
                    ),
                  ),
                ),
              ],
            ),
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
              } else {
                confirmDelete(index);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.add_box_outlined, size: 35, color: Colors.black),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ],
              gradient: LinearGradient(colors: [Colors.lime, Colors.teal])),
        ),
        onPressed: () {
          showDialog(
              useSafeArea: true,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add new element',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  content: TextField(onChanged: (String value) {
                    _userToDo = value;
                  }),
                  actions: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal)),
                        onPressed: () {
                          setState(() {
                            toDoList.add(_userToDo);
                          });
                          _isVisible.add(true);
                          _isDone.add(false);
                          Navigator.of(context).pop();
                        },
                        child: Text('ADD'))
                  ],
                );
              });
        },
      ),
    );
  }
}
