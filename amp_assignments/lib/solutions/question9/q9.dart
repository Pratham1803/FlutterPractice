import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Question9 extends StatelessWidget {
  const Question9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Question9 | Images'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImageCard(
                context: context,
                title: 'PNG IMAGE',
                imagePath: 'assets/pratham.png',
              ),
              const SizedBox(height: 16),
              _buildImageCard(
                context: context,
                title: 'JPG IMAGE',
                imagePath: 'assets/virat1.jpg',
              ),
              const SizedBox(height: 16),
              _buildImageCard(
                context: context,
                title: 'GIF IMAGE',
                imagePath: 'assets/sunflowers.gif',
              ),
              const SizedBox(height: 16),
              _buildNetworkImageCard(
                context: context,
                title: 'NETWORK IMAGE',
                imageUrl:
                    'https://www.charusat.ac.in/_next/static/media/c2.2dc1f03c.jpg',
                placeholder: "Charusat",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard({
    required BuildContext context,
    required String title,
    required String imagePath,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Image(
              image: AssetImage(imagePath),
              height: 250,
              width: 250,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNetworkImageCard({
    required BuildContext context,
    required String title,
    required String imageUrl,
    required String placeholder,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            FadeInImage.assetNetwork(
              placeholder: placeholder,
              image: imageUrl,
              height: 250,
              width: 250,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
