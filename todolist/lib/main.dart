import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_view/HomePage/HomePage.dart';
import 'package:list_view/HomePage/ThemeData.dart';

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(home: HomePage(), theme: theme.getTheme());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (context) => ThemeChanger(lightTheme()),
      child: MaterialAppWithTheme(),
    );
  }
}

void main() => runApp(MyApp());
