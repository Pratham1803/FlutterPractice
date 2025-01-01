import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.arrExpenses, required this.removeExpense});

  final List<ExpenseModel> arrExpenses;
  final Function(ExpenseModel expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: arrExpenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(arrExpenses[index]),
        onDismissed: (direction) {
          removeExpense(arrExpenses[index]);
        },
        background: Container(          
          margin: Theme.of(context).cardTheme.margin,
          decoration:  BoxDecoration(
            color: Theme.of(context).colorScheme.error.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: ExpensesItem(arrExpenses[index]),
      ),
    );
  }
}
