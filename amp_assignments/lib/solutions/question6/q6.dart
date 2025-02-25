import 'package:amp_assignments/solutions/question6/screen1.dart';
import 'package:amp_assignments/solutions/question6/screen2.dart';
import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Question6 extends StatelessWidget {
  const Question6({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'TabBar Example',
          tabBar: TabBar(
            tabs: [
              Tab(
                text: 'Screen 1',
              ),
              Tab(
                text: 'Screen 2',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Screen1(),
            Screen2(),
          ],
        ),
      ),
    );
  }
}
