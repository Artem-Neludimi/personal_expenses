import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'add_expenses.dart';
import 'db/database.dart';
import 'main.dart';
import 'month_expenses.dart';

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
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Add your first expense!'),
                );
              }
              final groupedExpenses = _buildMonthExpanse(snapshot.data!);

              return ListView.builder(
                itemCount: groupedExpenses.length,
                reverse: true,
                padding: const EdgeInsets.only(bottom: 16),
                itemBuilder: (BuildContext context, int index) {
                  return groupedExpenses[index];
                },
              );
            }),
      ),
      floatingActionButton: const _Floating(),
    );
  }

  List<Widget> _buildMonthExpanse(List<Expense> expenses) {
    final List<Widget> result = [];
    final Map<String, List<Expense>> groupedExpenses = {};
    for (var element in expenses) {
      final key = '${element.date.month}/${element.date.year}';
      if (groupedExpenses.containsKey(key)) {
        groupedExpenses[key]!.add(element);
      } else {
        groupedExpenses[key] = [element];
      }
    }
    groupedExpenses.forEach((key, value) {
      result.add(_Chart(date: key, expenses: value));
    });
    return result;
  }
}

class _Chart extends StatefulWidget {
  const _Chart({required this.date, required this.expenses});

  final String date;
  final List<Expense> expenses;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<_Chart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = [
      for (var element in ExpenseType.values)
        _ChartData(
          element.name,
          widget.expenses
              .where((element2) => element2.type == element.name)
              .fold<double>(0, (previousValue, element) => previousValue + element.amount),
        )
    ];
    final total = widget.expenses.fold<double>(0, (previousValue, element) => previousValue + element.amount);

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MonthExpenses(expenses: widget.expenses),
                    ),
                  );
                },
                child: Text(widget.date, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
            SfCircularChart(
              tooltipBehavior: _tooltip,
              series: [
                DoughnutSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                )
              ],
            ),
            Text('Total: ${total.toStringAsFixed(2)} \$')
          ],
        ),
      ),
    );
  }
}

class _Floating extends StatelessWidget {
  const _Floating();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (_) => Material(
            color: Colors.blue,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Add expense'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpenses()));
                  },
                ),
                ListTile(
                  title: const Text('Add income'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

enum ExpenseType {
  food,
  junkFood,
  transport,
  bills,
  entertainment,
  technic,
  other,
  ;

  String get name => switch (this) {
        ExpenseType.food => 'Food',
        ExpenseType.junkFood => 'Junk food',
        ExpenseType.transport => 'Transport',
        ExpenseType.bills => 'Bills',
        ExpenseType.entertainment => 'Entertainment',
        ExpenseType.technic => 'Technic',
        ExpenseType.other => 'Other',
      };
}
