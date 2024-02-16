import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {food, travel, leisure, work}

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
  late final String id;
  late final String title;
  late final double amount;
  late final DateTime date;
  late final Category category;

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