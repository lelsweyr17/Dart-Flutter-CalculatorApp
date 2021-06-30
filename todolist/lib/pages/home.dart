import 'package:flutter/material.dart';
import 'package:list_view/theme.dart';
import 'package:provider/provider.dart';

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
            textColor: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                _isVisible[index] = true;
              });
            }),
        duration: Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (_isVisible[index] == false) toDoList.remove(index);
  }

  Card createCard(int index) {
    return Card(
      elevation: 0,
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
    );
  }

  Dismissible dismissibleCard(BuildContext context, int index) {
    return Dismissible(
      behavior: HitTestBehavior.translucent,
      background: Container(
        color: Colors.green[400],
        width: 20.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Icon(Icons.archive, color: Colors.black54, size: 30)]),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red[400],
        width: 20.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Icon(Icons.delete_forever, color: Colors.black87, size: 30)
          ]),
        ),
      ),
      movementDuration: const Duration(milliseconds: 500),
      key: Key(toDoList[index]),
      child: Column(
        children: [
          Visibility(visible: _isVisible[index], child: createCard(index)),
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
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: CustomAppBar(),
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
                            if (darkMode == false) {
                              _themeChanger.setLightTheme();
                            } else {
                              _themeChanger.setDarkTheme();
                            }
                          });
                        },
                        icon: (darkMode == false
                            ? Icon(Icons.dark_mode_outlined,
                                color: Theme.of(context).accentColor)
                            : Icon(Icons.light_mode_outlined,
                                color: Theme.of(context).accentColor))),
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
        ),
      ),
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
            child: Icon(Icons.add, size: 30),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 30,
                    offset: Offset(0, 3))
              ],
            ),
          ),
          onPressed: () {
            showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.3),
                transitionBuilder: (context, a1, a2, widget) {
                  return Transform.scale(
                    scale: a1.value,
                    child: Opacity(
                      opacity: a1.value,
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        contentPadding: EdgeInsets.only(top: 10.0),
                        content: Container(
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: TextField(
                                  autofocus: true,
                                  onChanged: (String value) {
                                    _userToDo = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter Something",
                                    border: InputBorder.none,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  padding:
                                      EdgeInsets.only(top: 20.0, bottom: 20.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                  ),
                                  child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Theme.of(context)
                                                      .accentColor)),
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Text(
                                        'ADD',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                transitionDuration: Duration(milliseconds: 200),
                barrierDismissible: true,
                barrierLabel: '',
                context: context,
                pageBuilder: (context, animation1, animation2) {
                  return Text('PAGE BUILDER');
                });
          }),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar();

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text('TO DO',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))));
  }
}
