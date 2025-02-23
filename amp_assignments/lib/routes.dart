import 'package:amp_assignments/main.dart';
import 'package:amp_assignments/solutions/question1/q1.dart';
import 'package:amp_assignments/solutions/question2/interest.dart';
import 'package:amp_assignments/solutions/question3/minmax.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const MyApp(),
      '/q1': (context) => const Question1(),
      '/q2': (context) => const Interest(),
      '/q3':(context) => const Minmax(),
    };
  }
}