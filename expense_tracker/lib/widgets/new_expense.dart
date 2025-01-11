import 'package:expense_tracker/models/expense.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense(this.addExpenses, {super.key});
  final void Function(ExpenseModel model) addExpenses;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // var _TitleText = '';
  // void _saveTitleText(String titleText) {
  //   _TitleText = titleText;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _saveExpense() {
    final enterAmt = double.tryParse(_amountController.text);
    final isInValidAmt = enterAmt == null || enterAmt <= 0;
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
                Navigator.pop(context);
              },
              child: const Text('Dismiss'),
            ),
          ],
        ),
      );
      return;
    }
    ExpenseModel model = ExpenseModel(
        amount: enterAmt,
        title: _titleController.text.trim(),
        category: _selectedCategory,
        date: _selectedDate!);

    widget.addExpenses(model);
    Navigator.pop(context);
  }

  void _showDatePickerDialog() async {
    final DateTime now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final showDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = showDate;
    });
  }

  void _selectCategory(value) {
    if (value == null) return;
    setState(() {
      _selectedCategory = value;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Widget get _getTitleWidget {
    return TextField(
      // onChanged: _saveTitleText,
      controller: _titleController,
      decoration: const InputDecoration(
        labelText: 'Title',
      ),
    );
  }

  Widget get _getAmountWidget {
    return TextField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Amount',
        prefixText: '\$ ',
      ),
    );
  }

  Widget get _getCategoryDropDown {
    return DropdownButton(
      value: _selectedCategory,
      items: Category.values
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(category.name.toUpperCase()),
            ),
          )
          .toList(),
      onChanged: _selectCategory,
    );
  }

  Widget get _getDateWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_selectedDate == null
            ? 'No Date Selected'
            : formatter.format(_selectedDate!)),
        const SizedBox(width: 10),
        IconButton(
          onPressed: _showDatePickerDialog,
          icon: const Icon(Icons.calendar_month),
        )
      ],
    );
  }

  Widget get _getButtons {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {
            _titleController.clear();
            _amountController.clear();
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveExpense,
          child: const Text('Save Expense'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraint) {
      final width = constraint.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, keyboard + 15),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    children: [
                      Expanded(
                        child: _getTitleWidget,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: _getAmountWidget,
                      )
                    ],
                  )
                else
                  _getTitleWidget,
                if (width >= 600)
                  Row(children: [
                    Row(
                      children: [
                        _getCategoryDropDown,
                      ],
                    ),
                    Expanded(
                      child: _getDateWidget,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ])
                else
                  Row(
                    children: [
                      Expanded(
                        child: _getAmountWidget,
                      ),
                      Expanded(
                        child: _getDateWidget,
                      )
                    ],
                  ),
                const SizedBox(
                  height: 50,
                ),
                if (width >= 600)
                  _getButtons
                else
                  Row(
                    children: [
                      _getCategoryDropDown,
                      Expanded(
                        child: _getButtons,
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
