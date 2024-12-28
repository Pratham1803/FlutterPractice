import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.model.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(arrExpenses: _expenses),
          ),
        ],
      ),
    );
  }
}
