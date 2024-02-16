
import 'package:flutter/material.dart';

import '../../models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          ExpenseItem(expense: expenses[index]),
      itemCount: expenses.length,
    );
  }
}

class ExpenseItem extends StatelessWidget
{
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            Text(
                expense.title
            ),
            const SizedBox(height: 4.0),
            Row(
             children: [
               Text(
                   '\$${expense.amount.toStringAsFixed(2)}',
               ),
               const Spacer(),
               Row(
                   children: [
                     Icon(CategoryIcon[expense.category]),
                     SizedBox(width: 4.0),
                     Text(expense.formattedDate),
                   ],
                 ),
             ],
            ),
          ],
        ),
      ),
    );
  }
}