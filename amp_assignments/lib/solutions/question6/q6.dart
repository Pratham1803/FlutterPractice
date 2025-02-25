import 'package:amp_assignments/solutions/question6/screen1.dart';
import 'package:amp_assignments/solutions/question6/screen2.dart';
import 'package:flutter/material.dart';

class Question6 extends StatelessWidget {
  const Question6({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Screen 1',
              
              ),
              Tab(
                text: 'Screen 2',
              )
            ],            
          ),
          title: Text(
            'AMP Practical Assignments',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          elevation: 10,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          foregroundColor: Colors.white,
        ),
        body: const TabBarView(
          children: [
            Screen1(),
            Screen2(),
          ],
          
        ),
      ),
    );
  }
}
