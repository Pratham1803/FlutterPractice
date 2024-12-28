import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.arrExpenses});

  final List<ExpenseModel> arrExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: arrExpenses.length,
      itemBuilder: (context, index) => ExpensesItem(arrExpenses[index]),
    );
  }
}
