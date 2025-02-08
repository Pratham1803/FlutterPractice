// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.model.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _expenses = [
    ExpenseModel(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    ExpenseModel(
        title: 'Cinema',
        amount: 16.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void addExpense(ExpenseModel model) {
    setState(() {
      _expenses.add(model);
    });
  }

  void _removeExpense(ExpenseModel model) {
    int index = _expenses.indexOf(model);
    setState(
      () {
        _expenses.remove(model);

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            content: const Text('Expense Delete'),
            action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  setState(
                    () {
                      _expenses.insert(index, model);
                    },
                  );
                }),
          ),
        );
      },
    );
  }

  void _openAddExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // width of the device
    // print("Height = ${MediaQuery.of(context).size.height}");

    Widget mainContent = const Center(
      child: Text('No Expense Available, Try to Add a new one'),
    );

    if (_expenses.isNotEmpty) {
      mainContent = ExpensesList(
        arrExpenses: _expenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpense,
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(
                  expenses: _expenses,
                ),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _expenses,
                  ),
                ),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
