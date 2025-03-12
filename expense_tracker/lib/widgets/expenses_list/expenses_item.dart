// Importing the required files.
import 'package:expense_tracker/models/expense.model.dart'; // Importing the ExpenseModel to access expense details.
import 'package:flutter/material.dart'; // Importing Flutter material package for UI components.

/// A stateless widget that represents a single expense item.
class ExpensesItem extends StatelessWidget {
  // Constructor to initialize the expense model object.
  // This widget expects an `ExpenseModel` instance to display its data.
  const ExpensesItem(this.expenseModel, {super.key});

  // Property to store the expense data.
  final ExpenseModel expenseModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Using a Card widget to give a slight elevation effect.
      child: Padding(
        // Padding for spacing around the content.
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          // Column to arrange text and icons vertically.
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start (left).
          children: [
            Text(
              // Displaying the expense title.
              expenseModel
                  .title, // Fetching title from the expenseModel object.
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, // Applying theme-defined text style for large titles.
            ),
            Row(
              // Row to arrange amount and category/date in a single horizontal line.
              children: [
                Text('\$${expenseModel.amount.toStringAsFixed(2)}'),
                // Displaying the formatted amount with 2 decimal places.

                const Spacer(), // Spacer to push the following Row to the right.

                Row(
                  // Row to arrange category icon and formatted date together.
                  children: [
                    Icon(
                      categoryIcons[expenseModel.category],
                      // Fetching the corresponding icon for the expense category.
                    ),
                    const SizedBox(
                      width:
                          8, // Adding spacing between the icon and the date text.
                    ),
                    Text(expenseModel.formattedDate),
                    // Displaying the formatted date from the ExpenseModel.
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
