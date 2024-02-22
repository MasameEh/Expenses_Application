import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {food, travel, leisure, work}

// ignore: constant_identifier_names
const Map<Category, IconData> CategoryIcon =
<Category, IconData>{
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

final dateTime = DateFormat.yMd();

class Expense
{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate
  {
    return dateTime.format(date);
  }
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}


class ExpenseBucket
{
  late final Category category;
  late final List<Expense> expenses;

  ExpenseBucket(this.category, this.expenses);

  ExpenseBucket.forCategory(this.category, List<Expense> allExpenses)
  {
    expenses = allExpenses.where((element) => element.category == category).toList();
  }

  double get totalExpenses
  {
    double sum = 0;
    for(var expense in expenses)
    {
      sum = sum + expense.amount;
    }
    return sum;
  }
}