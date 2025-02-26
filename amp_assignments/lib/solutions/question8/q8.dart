import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Question8 extends StatelessWidget {
  const Question8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Question8 | ListView'),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) => Column(
          children: [
            ListTile(
              title: Text('Item Number ${index + 1}'),
              trailing: const Icon(Icons.arrow_right),
              subtitle: Text('Here is The Item Number ${index + 1}'),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
