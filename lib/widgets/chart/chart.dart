import 'package:expenses_app/widgets/chart/chartbar.dart';
import 'package:flutter/material.dart';

import '../../models/expense_model.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;


  List<ExpenseBucket> get buckets
  {
    return [
      ExpenseBucket.forCategory(Category.food, expenses),
      ExpenseBucket.forCategory(Category.work, expenses),
      ExpenseBucket.forCategory(Category.leisure, expenses),
      ExpenseBucket.forCategory(Category.travel, expenses),
    ];
  }

  double get maxTotalExpense
  {
    double maxExpense = 0.0;

    for(var element in buckets)
    {
      if(element.totalExpenses > maxExpense)
      {
        maxExpense = element.totalExpenses;
      }
    }
    return maxExpense;
  }


  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return LayoutBuilder(
      builder: (ctx, constraints)
      {
        return  Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: double.infinity,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
                Theme.of(context).colorScheme.primary.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children:
            [
              Expanded(
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:
                    [
                      for(var element in buckets) ChartBar(fill: element.totalExpenses == 0 ? 0
                          : element.totalExpenses / maxTotalExpense),
                    ],
                  )
              ),
              SizedBox(height: 12),
              Row(
                children:
                buckets.map((e) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Icon(CategoryIcon[e.category],
                      color: isDarkMode
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
                ).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}
