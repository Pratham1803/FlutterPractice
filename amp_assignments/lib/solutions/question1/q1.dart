import 'package:flutter/material.dart';
import 'dart:io';

class Question1 extends StatelessWidget {
  const Question1({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(data == '/q5' ? 'Program 5' : 'Program 1'),
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
      endDrawer: Drawer(
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  alignment: Alignment.topLeft,
                  icon: const Icon(Icons.arrow_back),
                ),
                const Spacer()
              ],
            ),
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/pratham.png'),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    '24MCA143',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.calculate,
                  color: Theme.of(context).colorScheme.onBackground),
              title: const Text('Interest Calculator'),
              onTap: () {
                Navigator.pop(context);
                if (data == '/q5') {
                  Navigator.pushNamed(context, '/q2');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.upcoming_sharp,
                  color: Theme.of(context).colorScheme.onBackground),
              title: const Text('MinMax'),
              onTap: () {
                Navigator.pop(context);
                if (data == '/q5') {
                  Navigator.pushNamed(context, '/q3');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.delivery_dining,
                  color: Theme.of(context).colorScheme.onBackground),
              title: const Text('Order Food'),
              onTap: () {
                Navigator.pop(context);
                if (data == '/q5') {
                  Navigator.pushNamed(context, '/q4');
                }
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.onBackground),
              title: const Text('Exit'),
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
