import 'package:flutter/material.dart';
import 'bmi.dart';
import 'about.dart';

void main() => runApp(MaterialApp(
        theme: ThemeData.light(),
        home: InputBMI(),
        routes: <String, WidgetBuilder>{
          '/satu': (BuildContext context) => InputBMI(),
          '/dua': (BuildContext context) => MyProfil(),
        }));
