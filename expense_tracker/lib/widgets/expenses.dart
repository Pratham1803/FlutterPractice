// Importing the required Flutter material package to build UI components.
import 'package:flutter/material.dart';

// Importing the ExpenseModel class to manage expense data.
import 'package:expense_tracker/models/expense.model.dart';

// Importing the ExpensesList widget to display a list of expenses.
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

// Importing the NewExpense widget, which allows users to add new expenses.
import 'package:expense_tracker/widgets/new_expense.dart';

// Importing the Chart widget to display expense trends visually.
import 'package:expense_tracker/widgets/chart/chart.dart';

// Defining a StatefulWidget called Expenses, which maintains a list of expenses.
class Expenses extends StatefulWidget {
  // Constructor to initialize the Expenses widget.
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState(); // Creating the state for this widget.
  }
}

// The corresponding State class for the Expenses widget.
class _ExpensesState extends State<Expenses> {
  // A list to store the user's expenses.
  final List<ExpenseModel> _expenses = [
    // Predefined expense: A Flutter course categorized under "work".
    ExpenseModel(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),

    // Predefined expense: A cinema expense categorized under "leisure".
    ExpenseModel(
        title: 'Cinema',
        amount: 16.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  // Function to add a new expense to the list.
  void addExpense(ExpenseModel model) {
    setState(() {
      _expenses.add(model); // Adding the new expense and updating the UI.
    });
  }

  // Function to remove an expense from the list.
  void _removeExpense(ExpenseModel model) {
    int index = _expenses.indexOf(model); // Find the index of the expense.

    setState(() {
      _expenses.remove(model); // Remove the expense from the list.

      // Clear any existing snack bars before showing a new one.
      ScaffoldMessenger.of(context).clearSnackBars();

      // Show a SnackBar to notify the user and provide an "Undo" option.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration:
              const Duration(seconds: 3), // Display duration of 3 seconds.
          content: const Text('Expense Deleted'), // Message to show.
          action: SnackBarAction(
            label: 'Undo', // Undo button label.
            onPressed: () {
              setState(() {
                _expenses.insert(index, model); // Restore the deleted expense.
              });
            },
          ),
        ),
      );
    });
  }

  // Function to open the bottom sheet where the user can add a new expense.
  void _openAddExpense() {
    showModalBottomSheet(
      useSafeArea: true, // Ensures the modal does not overlap system UI.
      isScrollControlled:
          true, // Allows modal to adjust height based on content.
      context: context,
      builder: (context) =>
          NewExpense(addExpense), // Passes addExpense function.
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the width of the device's screen.
    final width = MediaQuery.of(context).size.width;

    // Default UI when there are no expenses: Show a message.
    Widget mainContent = const Center(
      child: Text('No Expense Available, Try to Add a new one'),
    );

    // If there are expenses, display the ExpensesList widget.
    if (_expenses.isNotEmpty) {
      mainContent = ExpensesList(
        arrExpenses: _expenses, // Passing the list of expenses.
        removeExpense: _removeExpense, // Passing the remove function.
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'), // Title of the app.
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // Floating add button in the app bar.
            onPressed:
                _openAddExpense, // Opens the bottom sheet to add an expense.
          ),
        ],
      ),

      // Responsive UI: Changes layout based on screen width.
      body: width < 600 // If screen width is less than 600px (mobile)
          ? Column(
              children: [
                Chart(
                  expenses:
                      _expenses, // Pass the expenses list to the chart widget.
                ),
                Expanded(child: mainContent), // Expenses list or message.
              ],
            )
          : Row(
              // If screen width is greater than 600px (tablet or desktop)
              children: [
                Expanded(
                  child: Chart(
                    expenses: _expenses, // Display chart on one side.
                  ),
                ),
                Expanded(
                    child:
                        mainContent), // Display expenses list on the other side.
              ],
            ),
    );
  }
}
