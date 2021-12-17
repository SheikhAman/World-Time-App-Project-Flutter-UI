import 'dart:js';

import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(), // i cant usse it here because that conflict with first screen instead i will use initial route
    // in dart routes are like Map // this routes/Map expects key value pairs// this key in this routes map are going to be the actual routes themseles
    initialRoute:
        '/', // initialRoute property will take key and it will make it first scrren

    routes: {
      '/': (context) =>
          Loading(), // these function returns a widget that we want to load up when we go to this base route(when we first open the app) // the value of the different routes are going to be functions and these functions take the context object as an argument, these context object track where in the widget tree that we are in now // '/' it means the (default base route) first screen of the app
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
