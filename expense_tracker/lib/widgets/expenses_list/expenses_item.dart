import 'package:expense_tracker/models/expense.model.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expenseModel, {super.key});

  final ExpenseModel expenseModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseModel.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text('\$${expenseModel.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expenseModel.category],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expenseModel.formattedDate),
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
