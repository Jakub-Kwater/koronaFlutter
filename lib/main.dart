import 'package:corona_monitor_flutter/loading.dart';
import 'package:corona_monitor_flutter/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/':(context) => LoadingScreen(),
    '/main': (context) => MainScreen(),
  }
));


