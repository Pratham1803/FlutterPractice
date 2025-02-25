import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final TabBar? tabBar;
  const CustomAppBar(
      {super.key, required this.title, this.actions, this.tabBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      actions: actions,
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
      bottom: tabBar,
    );
  }

  @override
  Size get preferredSize{
    final double tabBarHeight = tabBar?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + tabBarHeight);
  }
}
