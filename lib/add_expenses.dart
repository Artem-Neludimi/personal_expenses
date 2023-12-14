import 'package:flutter/material.dart';

import 'db/database.dart';
import 'main.dart';
import 'my_home_page.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  final _nameController = TextEditingController();
  var _expenseType = ExpenseType.food;
  final _amountController = TextEditingController();
  var _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add expenses'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            db.expenseDao.insertExpense(ExpensesCompanion.insert(
              id: UniqueKey().toString(),
              name: _nameController.text,
              type: _expenseType.name,
              amount: double.parse(_amountController.text),
              date: _date,
            ));

            Navigator.pop(context);
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(height: 16),
                const Text('Type'),
                DropdownButton(
                    value: _expenseType,
                    items: ExpenseType.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => _expenseType = value!);
                    }),
                const SizedBox(height: 16),
                TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Date'),
                    TextButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _date,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025),
                        );

                        if (date != null) {
                          setState(() => _date = date);
                        }
                      },
                      child: Text('${_date.day}/${_date.month}/${_date.year}'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
