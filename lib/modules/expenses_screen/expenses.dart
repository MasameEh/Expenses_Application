
import 'package:flutter/material.dart';

import '../../models/expense_model.dart';
import '../../widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses= [
    Expense(
        amount: 26.6,
        category: Category.work,
        date: DateTime.now(),
        title: 'Flutter Course',
    ),
    Expense(
      amount: 30.0,
      category: Category.food,
      date: DateTime.now(),
      title: 'KFC',
    ),
    Expense(
      amount: 26.6,
      category: Category.travel,
      date: DateTime.now(),
      title: 'Dahab',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      title: Text('ExpenseTracker'),
        titleSpacing: 100.0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses),
            ),
          ],
        ),
      ),
    );
  }
}


