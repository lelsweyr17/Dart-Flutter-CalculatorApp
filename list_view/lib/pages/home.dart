import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [];
  String _userToDo = '';

  void initState() {
    super.initState();
    toDoList.addAll(['Milk', 'Bread', 'Honey', 'Cheese']);
  }

  void confirmDialog(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lime)),
                  onPressed: () {
                    setState(() {
                      toDoList.removeAt(index);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('DELETE')),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lime)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('CANCEL'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: new Container(
          child: Center(
              child: Text('TODO',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          padding: const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
          decoration: new BoxDecoration(
              gradient:
                  new LinearGradient(colors: [Colors.lime, Colors.yellow]),
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
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(color: Colors.red[500]),
            movementDuration: const Duration(milliseconds: 500),
            key: Key(toDoList[index]),
            child: Card(
              child: ListTile(
                title: Text(toDoList[index]),
                trailing: IconButton(
                    icon: Icon(Icons.delete_outlined, color: Colors.red[500]),
                    onPressed: () {
                      confirmDialog(index);
                    }),
              ),
            ),
            confirmDismiss: (DismissDirection direction) async {
              confirmDialog(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.add_box_outlined, size: 40),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Colors.lime, Colors.yellow])),
        ),
        onPressed: () {
          showDialog(
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
                                MaterialStateProperty.all(Colors.lime)),
                        onPressed: () {
                          setState(() {
                            toDoList.add(_userToDo);
                          });
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
