import 'package:drift/drift.dart';

part 'database.g.dart';

class Expenses extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get amount => integer()();
}

@DriftAccessor(tables: [Expenses])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  final AppDatabase db;

  ExpenseDao(this.db) : super(db);

  Future<void> insertExpense(Insertable<Expense> expense) => into(expenses).insert(expense);
  Stream<List<Expense>> watchAllExpenses() => select(expenses).watch();
  Future<int> deleteExpenseById(String id) => (delete(expenses)..where((expense) => expense.id.equals(id))).go();
}

// To generate the database.g.dart:
// RUN: flutter packages pub run build_runner watch
@DriftDatabase(tables: [Expenses], daos: [ExpenseDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 3;
}
