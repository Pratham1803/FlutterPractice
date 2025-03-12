// Importing necessary Flutter and application-specific files.
import 'package:flutter/material.dart'; // Provides UI components.
import 'package:expense_tracker/widgets/chart/chart_bar.dart'; // Importing ChartBar widget to display individual bars.
import 'package:expense_tracker/models/expense.model.dart'; // Importing ExpenseModel for managing expense data.

/// A stateless widget that represents a bar chart displaying categorized expenses.
class Chart extends StatelessWidget {
  // Constructor requiring a list of expenses.
  const Chart({super.key, required this.expenses});

  final List<ExpenseModel> expenses; // List of all expenses to be displayed.

  /// Generates a list of `ExpenseBucket` objects, grouping expenses by category.
  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(
          expenses, Category.food), // Bucket for Food category.
      ExpenseBucket.forCategory(
          expenses, Category.leisure), // Bucket for Leisure category.
      ExpenseBucket.forCategory(
          expenses, Category.travel), // Bucket for Travel category.
      ExpenseBucket.forCategory(
          expenses, Category.work), // Bucket for Work category.
    ];
  }

  /// Computes the maximum total expense among all categories to normalize bar heights.
  double get maxTotalExpense {
    double maxTotalExpense = 0; // Stores the highest category total.

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense =
            bucket.totalExpenses; // Updates if a higher value is found.
      }
    }

    return maxTotalExpense; // Returns the highest total expense.
  }

  @override
  Widget build(BuildContext context) {
    // Determines if the device is in dark mode.
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      // Adds margin around the chart.
      margin: const EdgeInsets.all(16),
      // Adds internal padding for spacing within the chart.
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity, // Makes the chart expand to full width.
      height: 180, // Sets a fixed height for the chart.

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            8), // Rounds the corners of the chart background.
        gradient: LinearGradient(
          // Adds a fading gradient background effect.
          colors: [
            Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(0.3), // Light gradient color.
            Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(0.0), // Fades to transparent.
          ],
          begin: Alignment.bottomCenter, // Gradient starts from the bottom.
          end: Alignment.topCenter, // Gradient fades towards the top.
        ),
      ),

      // Column layout for arranging bars and icons.
      child: Column(
        children: [
          Expanded(
            // Row containing the chart bars, aligned to the bottom.
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket
                    in buckets) // Iterates over each expense bucket.
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                    // Normalizes the bar height relative to the maximum total expense.
                  ),
              ],
            ),
          ),

          const SizedBox(height: 12), // Adds spacing between bars and icons.

          // Row for displaying category icons under the bars.
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4), // Adds spacing between icons.
                      child: Icon(
                        categoryIcons[
                            bucket.category], // Fetches icon based on category.
                        color: isDarkMode
                            ? Theme.of(context)
                                .colorScheme
                                .secondary // Uses secondary color in dark mode.
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                        // Uses primary color with slight transparency in light mode.
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
