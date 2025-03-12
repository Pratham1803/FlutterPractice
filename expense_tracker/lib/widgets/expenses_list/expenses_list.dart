// Importing necessary packages and files.
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
// Importing ExpensesItem widget to display individual expense items.

import 'package:flutter/material.dart';
// Importing Flutter Material package for UI components.

import 'package:expense_tracker/models/expense.model.dart';
// Importing ExpenseModel to handle expense data.

/// A stateless widget that displays a list of expenses.
class ExpensesList extends StatelessWidget {
  // Constructor with required parameters to accept the list of expenses
  // and a callback function to remove an expense.
  const ExpensesList({
    super.key,
    required this.arrExpenses, // List of expenses to display.
    required this.removeExpense, // Function to remove an expense when dismissed.
  });

  final List<ExpenseModel> arrExpenses; // Holds the list of expenses.
  final Function(ExpenseModel expense)
      removeExpense; // Callback to remove an expense.

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // `ListView.builder` efficiently creates and displays items in a scrollable list.
      itemCount: arrExpenses.length, // Defines the number of items in the list.
      itemBuilder: (context, index) => Dismissible(
        // `Dismissible` allows swiping to remove an item.
        key: ValueKey(
            arrExpenses[index]), // Unique key for each item to track state.
        onDismissed: (direction) {
          // Called when the user dismisses an item (swipes it away).
          removeExpense(
              arrExpenses[index]); // Calls the function to remove the expense.
        },
        background: Container(
          // Background shown behind the item when swiped.
          margin: Theme.of(context).cardTheme.margin,
          // Uses the theme-defined margin for uniform spacing.
          decoration: BoxDecoration(
            // Applies styling to the background.
            color: Theme.of(context).colorScheme.error.withOpacity(0.5),
            // Uses the theme-defined error color with reduced opacity (red shade).
            borderRadius: const BorderRadius.all(
              Radius.circular(10), // Rounds the corners for a smooth UI.
            ),
          ),
        ),
        child: ExpensesItem(arrExpenses[index]),
        // Displays an individual expense item using the ExpensesItem widget.
      ),
    );
  }
}
