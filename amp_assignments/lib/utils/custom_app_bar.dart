import 'package:flutter/material.dart';

/// **CustomAppBar Widget**
/// A reusable app bar widget that supports:
/// - A dynamic title.
/// - Optional actions (icons/buttons).
/// - An optional `TabBar` at the bottom.
/// - A gradient background.
/// - Custom elevation for a shadow effect.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  // Title of the AppBar.
  final String title;

  // Optional list of widgets (e.g., icons, buttons) for the AppBar actions.
  final List<Widget>? actions;

  // Optional TabBar to be added at the bottom of the AppBar.
  final TabBar? tabBar;

  /// **Constructor**
  /// - `title` (required): The text shown in the AppBar.
  /// - `actions` (optional): List of widgets (e.g., IconButton).
  /// - `tabBar` (optional): Allows adding tabs to the AppBar.
  const CustomAppBar({
    super.key, 
    required this.title, 
    this.actions, 
    this.tabBar
  });

  /// **Build method: Returns the AppBar UI**
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // **Title Text Styling**
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary, // Adjusts text color based on theme.
            ),
      ),

      // **Actions (optional)**
      actions: actions,

      // **Elevation (shadow effect)**
      elevation: 10,

      // **Background gradient effect**
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300, // Light blue (top-left)
              Colors.blue.shade600, // Darker blue (bottom-right)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),

      // **Foreground color (used for back button & icon colors)**
      foregroundColor: Colors.white,

      // **TabBar (optional)**
      bottom: tabBar,
    );
  }

  /// **Sets the preferred size for the AppBar**
  /// - Ensures correct height if a `TabBar` is included.
  @override
  Size get preferredSize {
    final double tabBarHeight = tabBar?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + tabBarHeight);
  }
}
