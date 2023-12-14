import 'package:flutter/material.dart';
import 'package:personal_expenses/db/database.dart';

import 'main.dart';

class MonthExpenses extends StatelessWidget {
  const MonthExpenses({super.key, required this.expenses});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    final date = expenses[0].date;
    return Scaffold(
      appBar: AppBar(
        title: Text('${date.month}/${date.year} Expenses'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(expenses[index].id),
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Delete"),
                    content: const Text("Are you sure you want to delete this expense?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("Delete"),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              db.expenseDao.deleteExpenseById(expenses[index].id);
            },
            child: Card(
              child: ListTile(
                title: Text(expenses[index].name),
                subtitle: Text(expenses[index].type),
                trailing: Text(expenses[index].amount.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
