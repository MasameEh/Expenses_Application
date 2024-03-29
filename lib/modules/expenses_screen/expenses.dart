
import 'package:flutter/material.dart';

import '../../models/expense_model.dart';
import '../../widgets/chart/chart.dart';
import '../../widgets/expenses_list/expenses_list.dart';
import '../../widgets/new_expense/new_expense.dart';

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

  void _addExpense(Expense expense)
  {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense)
  {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }
  @override
  Widget build(BuildContext context) {

    var width =  MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()
              {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) => NewExpense(addNewExpense: _addExpense),
                  showDragHandle: true,
                );
              },
              icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: width < 600 ? Column(
          children: [
            Expanded(child: Chart(expenses: _registeredExpenses)),
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses, removeExpense: _removeExpense),
            ),
          ],
        ): Row(
          children: [
            Expanded(child: Chart(expenses: _registeredExpenses)),
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses, removeExpense: _removeExpense),
            ),
          ],
        ),
      ),
    );
  }
}


