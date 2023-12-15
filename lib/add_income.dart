import 'package:flutter/material.dart';

import 'db/database.dart';
import 'main.dart';

class AddIncomes extends StatefulWidget {
  const AddIncomes({super.key});

  @override
  State<AddIncomes> createState() => _AddIncomesState();
}

class _AddIncomesState extends State<AddIncomes> {
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
            db.incomeDao.insertIncome(IncomesCompanion.insert(
              id: UniqueKey().toString(),
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
