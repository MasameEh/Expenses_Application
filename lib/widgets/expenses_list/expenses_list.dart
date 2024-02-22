
import 'package:flutter/material.dart';

import '../../models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final void Function(Expense expense) removeExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(.5),
                margin: Theme.of(context).cardTheme.margin,
              ),
              key: ValueKey(expenses[index]),
              child: ExpenseItem(expense: expenses[index]),
              onDismissed: (direction) => removeExpense(expenses[index]),
          ),
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
                expense.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
            ),
            const SizedBox(height: 4.0),
            Row(
             children: [
               Text(
                   '\$${expense.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
               ),
               const Spacer(),
               Row(
                   children: [
                     Icon(CategoryIcon[expense.category]),
                     SizedBox(width: 4.0),
                     Text(expense.formattedDate,
                       style: const TextStyle(
                         color: Colors.black,
                       ),
                     ),
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