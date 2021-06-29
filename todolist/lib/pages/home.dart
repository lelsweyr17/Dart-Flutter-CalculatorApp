import 'package:flutter/material.dart';

bool darkMode = false;

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
            label: 'Undo',
            onPressed: () {
              setState(() {
                _isVisible[index] = true;
              });
            }),
        duration: Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (_isVisible[index] == false) toDoList.remove(index);
  }

  Dismissible dismissibleCard(BuildContext context, int index) {
    return Dismissible(
      behavior: HitTestBehavior.translucent,
      background: Container(
        color: Colors.green[600],
        width: 20.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Icon(Icons.archive, color: Colors.black54, size: 30)]),
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
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
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
                    icon: Icon(Icons.delete_outlined, color: Colors.red[600]),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('TO DO',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          backgroundColor: Colors.pink,
          elevation: 15,
          shadowColor: Colors.redAccent,
          brightness: Brightness.dark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)))),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TO DO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          darkMode = !darkMode;
                        });
                      },
                      icon: (darkMode == false
                          ? Icon(Icons.dark_mode_outlined)
                          : Icon(Icons.light_mode))),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0)),
          ListTile(
            title: Text('First Menu Item'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Second Menu Item'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('About'),
            onTap: () {},
          ),
        ],
      )),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return dismissibleCard(context, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.add_box_outlined, size: 30, color: Colors.black),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 30,
                    offset: Offset(0, 3))
              ],
              gradient: LinearGradient(colors: [Colors.pink, Colors.red])),
        ),
        onPressed: () {
          showDialog(
              useSafeArea: true,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  title: Text('Create new element',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  content: TextField(onChanged: (String value) {
                    _userToDo = value;
                  }),
                  actions: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.pink)),
                        onPressed: () {
                          setState(() {
                            toDoList.add(_userToDo);
                          });
                          _isVisible.add(true);
                          _isDone.add(false);
                          Navigator.of(context).pop();
                          final snackBar = SnackBar(
                              content: Text('Element is created'),
                              duration: Duration(seconds: 2));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
