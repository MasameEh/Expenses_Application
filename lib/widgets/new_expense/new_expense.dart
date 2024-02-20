import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}


class _NewExpenseState extends State<NewExpense> {

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateFormat formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefix: Icon(Icons.attach_money),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Row(
                children: [
                  Text(_selectedDate != null ? formatter.format(_selectedDate!): 'No Date Selected'),
                  IconButton(
                      onPressed: () async
                      {
                        final now = DateTime.now();
                        final firstDate = DateTime(now.year-1, now.month, now.day);
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: firstDate,
                            lastDate: now
                        );
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      },
                      icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0,),
          Row(
          children: [
            DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name.toUpperCase()), )
                ).toList(),
                onChanged: (newCategory)
                {
                  if(newCategory == null)
                  {
                    return;
                  }
                  setState(()
                  {
                    _selectedCategory = newCategory;
                  }
                  );
                }
            ),
            const Spacer(),
            TextButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
            ),
            ElevatedButton(
                onPressed: ()
                {
                  final double? enteredAmount = double.tryParse(amountController.text);
                  final bool amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

                  if(amountIsInvalid || titleController.text.trim().isEmpty || _selectedDate == null)
                  {

                  }
                },
                child: const Text('Save expense'),
            ),
          ],
          ),
        ],
      ),
    );
  }
}
