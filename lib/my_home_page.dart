import 'package:flutter/material.dart';
import 'package:personal_expenses/main.dart';

import 'db/database.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My expenses'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: StreamBuilder<List<Expense>>(
            stream: db.expenseDao.watchAllExpenses(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.only(bottom: 16),
                itemBuilder: (BuildContext context, int index) {
                  final date = snapshot.data![index].date;
                  final dateStr = '${date.day}/${date.month}/${date.year}';
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      subtitle: Text('${snapshot.data![index].type} - $dateStr'),
                      trailing: Text('${snapshot.data![index].amount} \$'),
                    ),
                  );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          db.expenseDao.insertExpense(ExpensesCompanion.insert(
            id: UniqueKey().toString(),
            name: 'fnew;eewoinewweinonweieninffweinewfioniowefnniowefinofweinfoweinowfeinowefwnieniowef',
            type: ExpenseType.junkFood.name,
            amount: 10,
            date: DateTime.now(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

enum ExpenseType {
  food,
  junkFood,
  transport,
  bills,
  entertainment,
  other,
  ;

  factory ExpenseType.fromString(String value) => switch (value) {
        'food' => ExpenseType.food,
        'junkFood' => ExpenseType.junkFood,
        'transport' => ExpenseType.transport,
        'bills' => ExpenseType.bills,
        'entertainment' => ExpenseType.entertainment,
        'other' => ExpenseType.other,
        _ => ExpenseType.other,
      };

  String get name => switch (this) {
        ExpenseType.food => 'Food',
        ExpenseType.junkFood => 'Junk food',
        ExpenseType.transport => 'Transport',
        ExpenseType.bills => 'Bills',
        ExpenseType.entertainment => 'Entertainment',
        ExpenseType.other => 'Other',
      };
}
