// Importing required packages.
import 'package:flutter/material.dart'; // Provides UI components.
import 'package:uuid/uuid.dart'; // Package for generating unique IDs.
import 'package:intl/intl.dart'; // Package for formatting dates.

/// A constant instance of `Uuid` to generate unique IDs for expenses.
const uuid = Uuid();

/// A date formatter that formats dates in the `yMd` (Year/Month/Day) format.
final formatter = DateFormat.yMd();

/// Enum defining different categories of expenses.
enum Category {
  food,   // Represents food-related expenses.
  travel, // Represents travel-related expenses.
  leisure, // Represents leisure and entertainment expenses.
  work,   // Represents work-related expenses.
}

/// A constant map associating each `Category` with a corresponding icon.
const categoryIcons = {
  Category.food: Icons.lunch_dining, // Food category icon.
  Category.travel: Icons.flight_takeoff, // Travel category icon.
  Category.leisure: Icons.movie, // Leisure category icon.
  Category.work: Icons.work, // Work category icon.
};

/// **ExpenseModel**: Represents a single expense entry.
class ExpenseModel {
  /// Constructor for creating an expense model.
  ExpenseModel({
    required this.title, // Expense title (e.g., "Lunch", "Flight Ticket").
    required this.amount, // Expense amount in double (e.g., 50.99).
    required this.date, // Date when the expense occurred.
    required this.category, // Expense category (e.g., Category.food).
  }) : id = uuid.v4(); // Generates a unique ID for each expense.

  final String id; // Unique identifier for the expense.
  final String title; // Title of the expense.
  final double amount; // Amount spent.
  final DateTime date; // Date of the expense.
  final Category category; // Category of the expense.

  /// Returns the formatted date of the expense using `formatter`.
  String get formattedDate {
    return formatter.format(date); // Converts `DateTime` to a readable format.
  }
}

// / **ExpenseBucket**: Groups expenses by category and calculates total expenses.
class ExpenseBucket {
  /// Constructor for manually providing a list of expenses for a category.
  ExpenseBucket({
    required this.category, // The category of expenses.
    required this.expenses, // List of expenses belonging to this category.
  });

  /// Named constructor to filter and create a bucket from a list of all expenses.
  ExpenseBucket.forCategory(List<ExpenseModel> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category) // Filters expenses by category.
            .toList(); // Converts filtered results into a list.

  final Category category; // The category this bucket represents.
  final List<ExpenseModel> expenses; // List of expenses in this category.

  /// Computes the total sum of expenses in this bucket.
  double get totalExpenses {
    double sum = 0; // Variable to store total sum.

    for (final expense in expenses) {
      sum += expense.amount; // Adds each expense amount to the sum.
    }

    return sum; // Returns the total amount spent in this category.
  }
}
