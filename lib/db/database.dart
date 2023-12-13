import 'package:drift/drift.dart';

part 'database.g.dart';

class Convertations extends Table {
  TextColumn get id => text()();
  TextColumn get name1 => text()();
  TextColumn get name2 => text()();
  IntColumn get value1 => integer()();
  IntColumn get value2 => integer()();
  IntColumn get formula => integer()();
}

@DriftAccessor(tables: [Convertations])
class ConvertationDao extends DatabaseAccessor<AppDatabase> with _$ConvertationDaoMixin {
  final AppDatabase db;

  ConvertationDao(this.db) : super(db);

  Future<void> insertConvertation(Insertable<Convertation> convertation) => into(convertations).insert(convertation);
  Stream<List<Convertation>> watchAllConvertations() => select(convertations).watch();
  Future<int> deleteConvertationById(String id) =>
      (delete(convertations)..where((convertation) => convertation.id.equals(id))).go();
}

// To generate the database.g.dart:
// RUN: flutter packages pub run build_runner watch
@DriftDatabase(tables: [Convertations], daos: [ConvertationDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 3;
}
