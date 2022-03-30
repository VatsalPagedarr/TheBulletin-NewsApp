// import 'dart:_http';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thebulletin/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Colors.white,
      ),
      home: Home(),
    );
  }
}


