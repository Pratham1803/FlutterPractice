import 'package:expense_tracker/models/expense.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Formatter for formatting date into a readable format (MM/DD/YYYY)
final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense(this.addExpenses, {super.key});

  // Callback function to add a new expense, passed from parent widget
  final void Function(ExpenseModel model) addExpenses;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // Controllers to capture user input for title and amount
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // Stores selected date and category for the expense
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  // Function to validate input and save the expense
  void _saveExpense() {
    final enterAmt = double.tryParse(_amountController.text);
    final isInValidAmt = enterAmt == null || enterAmt <= 0;

    // If any input is invalid, show an alert dialog
    if (isInValidAmt ||
        _titleController.text.trim().isEmpty ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please Fill All The Fields'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Dismiss'),
            ),
          ],
        ),
      );
      return;
    }

    // Create a new expense model with user input
    ExpenseModel model = ExpenseModel(
        amount: enterAmt,
        title: _titleController.text.trim(),
        category: _selectedCategory,
        date: _selectedDate!);

    widget.addExpenses(model); // Pass expense to the parent widget
    Navigator.pop(context); // Close the input form
  }

  // Function to show the date picker dialog
  void _showDatePickerDialog() async {
    final DateTime now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    // Show date picker and wait for user selection
    final showDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = showDate; // Update selected date
    });
  }

  // Function to handle category selection from dropdown
  void _selectCategory(value) {
    if (value == null) return;
    setState(() {
      _selectedCategory = value;
    });
  }

  // Dispose controllers when the widget is removed
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // Widget to get title input field
  Widget get _getTitleWidget {
    return TextField(
      controller: _titleController,
      decoration: const InputDecoration(
        labelText: 'Title', // Placeholder label for user guidance
      ),
    );
  }

  // Widget to get amount input field
  Widget get _getAmountWidget {
    return TextField(
      controller: _amountController,
      keyboardType: TextInputType.number, // Allows only numeric input
      decoration: const InputDecoration(
        labelText: 'Amount',
        prefixText: '\$ ', // Adds currency symbol
      ),
    );
  }

  // Widget to get category dropdown
  Widget get _getCategoryDropDown {
    return DropdownButton(
      value: _selectedCategory, // Default selected category
      items: Category.values
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(category.name
                  .toUpperCase()), // Show category name in uppercase
            ),
          )
          .toList(),
      onChanged: _selectCategory, // Updates category on selection
    );
  }

  // Widget to display selected date and allow date selection
  Widget get _getDateWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_selectedDate == null
            ? 'No Date Selected' // Default text when no date is picked
            : formatter
                .format(_selectedDate!)), // Show selected date in formatted way
        const SizedBox(width: 10), // Adds spacing
        IconButton(
          onPressed: _showDatePickerDialog, // Opens date picker dialog
          icon: const Icon(Icons.calendar_month), // Calendar icon
        )
      ],
    );
  }

  // Buttons for cancelling or saving the expense
  Widget get _getButtons {
    return Row(
      children: [
        const Spacer(), // Pushes buttons to the right
        TextButton(
          onPressed: () {
            _titleController.clear();
            _amountController.clear();
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveExpense, // Saves expense
          child: const Text('Save Expense'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboard =
        MediaQuery.of(context).viewInsets.bottom; // Detects keyboard visibility

    return LayoutBuilder(builder: (ctx, constraint) {
      final width = constraint.maxWidth; // Get screen width

      return SizedBox(
        height: double.infinity, // Expand to full height
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                15, 15, 15, keyboard + 15), // Adjust padding based on keyboard
            child: Column(
              children: [
                if (width >= 600) // If screen is wide, arrange inputs in a row
                  Row(
                    children: [
                      Expanded(
                        child: _getTitleWidget, // Title input field
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: _getAmountWidget, // Amount input field
                      )
                    ],
                  )
                else
                  _getTitleWidget, // Show title field normally in smaller screens

                if (width >=
                    600) // If wide screen, show category dropdown and date in one row
                  Row(children: [
                    Row(
                      children: [
                        _getCategoryDropDown, // Category selection
                      ],
                    ),
                    Expanded(
                      child: _getDateWidget, // Date selection
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ])
                else
                  Row(
                    children: [
                      Expanded(
                        child:
                            _getAmountWidget, // Amount field in smaller screens
                      ),
                      Expanded(
                        child: _getDateWidget, // Date picker button
                      )
                    ],
                  ),

                const SizedBox(
                  height: 50,
                ),

                if (width >= 600) // If wide screen, show buttons normally
                  _getButtons
                else
                  Row(
                    children: [
                      _getCategoryDropDown, // Category dropdown in a row with buttons
                      Expanded(
                        child: _getButtons, // Save and cancel buttons
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
