import 'package:drift/drift.dart';

part 'database.g.dart';

class Expenses extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
}

class Incomes extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
}

@DriftAccessor(tables: [Expenses])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  final AppDatabase db;

  ExpenseDao(this.db) : super(db);

  Future<void> insertExpense(Insertable<Expense> expense) => into(expenses).insert(expense);
  Stream<List<Expense>> watchAllExpenses() => select(expenses).watch();
  Future<int> deleteExpenseById(String id) => (delete(expenses)..where((expense) => expense.id.equals(id))).go();
}

@DriftAccessor(tables: [Incomes])
class IncomeDao extends DatabaseAccessor<AppDatabase> with _$IncomeDaoMixin {
  final AppDatabase db;

  IncomeDao(this.db) : super(db);

  Future<void> insertIncome(Insertable<Income> income) => into(incomes).insert(income);
  Stream<List<Income>> watchAllIncomes() => select(incomes).watch();
  Future<int> deleteIncomeById(String id) => (delete(incomes)..where((income) => income.id.equals(id))).go();
}

// To generate the database.g.dart:
// RUN: flutter packages pub run build_runner watch
@DriftDatabase(
  tables: [Expenses, Incomes],
  daos: [ExpenseDao, IncomeDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 3;
}
