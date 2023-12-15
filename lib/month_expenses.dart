import 'package:flutter/material.dart';
import 'package:personal_expenses/db/database.dart';

import 'main.dart';

class MonthExpenses extends StatelessWidget {
  const MonthExpenses({super.key, required this.expenses, required this.incomes});
  final List<Expense> expenses;
  final List<Income> incomes;
  @override
  Widget build(BuildContext context) {
    final date = expenses[0].date;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${date.month}/${date.year} Expenses'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Expenses'),
              Tab(text: 'Incomes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: expenses.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                final date = expenses[index].date;
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
                      subtitle: Row(
                        children: [
                          Text(expenses[index].type),
                          const SizedBox(width: 8),
                          Text('${date.day}/${date.month}/${date.year}'),
                        ],
                      ),
                      trailing: Text('${expenses[index].amount} \$'),
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: incomes.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                final date = incomes[index].date;
                return Dismissible(
                  key: Key(incomes[index].id),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm Delete"),
                          content: const Text("Are you sure you want to delete this income?"),
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
                    db.incomeDao.deleteIncomeById(incomes[index].id);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('${date.day}/${date.month}/${date.year}'),
                      trailing: Text('${incomes[index].amount} \$'),
                    ),
                  ),
                );
              },
            ),

            // Tab 2 content
          ],
        ),
      ),
    );
  }
}
