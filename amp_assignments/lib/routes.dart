import 'package:amp_assignments/main.dart';
import 'package:amp_assignments/solutions/question1/q1.dart';
import 'package:amp_assignments/solutions/question10/errormsg.dart';
import 'package:amp_assignments/solutions/question10/login.dart';
import 'package:amp_assignments/solutions/question10/welcome.dart';
import 'package:amp_assignments/solutions/question11/q11.dart';
import 'package:amp_assignments/solutions/question12/q12.dart';
import 'package:amp_assignments/solutions/question2/interest.dart';
import 'package:amp_assignments/solutions/question3/minmax.dart';
import 'package:amp_assignments/solutions/question4/orderfood.dart';
import 'package:amp_assignments/solutions/question6/Q6.dart';
import 'package:amp_assignments/solutions/question7/q7.dart';
import 'package:amp_assignments/solutions/question7/screen2.dart';
import 'package:amp_assignments/solutions/question7/screen3.dart';
import 'package:amp_assignments/solutions/question7/screen4.dart';
import 'package:amp_assignments/solutions/question8/q8.dart';
import 'package:amp_assignments/solutions/question9/q9.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const MyApp(),
      '/q1': (context) => const Question1(),
      '/q2': (context) => const Interest(),
      '/q3':(context) => const Minmax(),
      '/q4':(context) => const OrderFood(),
      '/q5':(context) => const Question1(),
      '/q6':(context) => const Question6(),
      '/q7':(context) => const Question7(),
      '/q7/s2':(context) => const Screen2(),
      '/q7/s3':(context) => const Screen3(),
      '/q7/s4':(context) => const Screen4(),
      '/q8':(context) => const Question8(),
      '/q9':(context) => const Question9(),
      '/q10':(context) => const Question10(),
      '/q10/welcome':(context) => const Welcome(),
      '/q10/errorMsg':(context) => const Errormsg(),
      '/q11':(context) => const Question11(),
      '/q12':(context) => const Question12(),
    };
  }
}