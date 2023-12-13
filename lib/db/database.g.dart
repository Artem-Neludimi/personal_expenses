// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
mixin _$ConvertationDaoMixin on DatabaseAccessor<AppDatabase> {
  $ConvertationsTable get convertations => attachedDatabase.convertations;
}

class $ConvertationsTable extends Convertations
    with TableInfo<$ConvertationsTable, Convertation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConvertationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _name1Meta = const VerificationMeta('name1');
  @override
  late final GeneratedColumn<String> name1 = GeneratedColumn<String>(
      'name1', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _name2Meta = const VerificationMeta('name2');
  @override
  late final GeneratedColumn<String> name2 = GeneratedColumn<String>(
      'name2', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value1Meta = const VerificationMeta('value1');
  @override
  late final GeneratedColumn<int> value1 = GeneratedColumn<int>(
      'value1', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _value2Meta = const VerificationMeta('value2');
  @override
  late final GeneratedColumn<int> value2 = GeneratedColumn<int>(
      'value2', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _formulaMeta =
      const VerificationMeta('formula');
  @override
  late final GeneratedColumn<int> formula = GeneratedColumn<int>(
      'formula', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name1, name2, value1, value2, formula];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'convertations';
  @override
  VerificationContext validateIntegrity(Insertable<Convertation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name1')) {
      context.handle(
          _name1Meta, name1.isAcceptableOrUnknown(data['name1']!, _name1Meta));
    } else if (isInserting) {
      context.missing(_name1Meta);
    }
    if (data.containsKey('name2')) {
      context.handle(
          _name2Meta, name2.isAcceptableOrUnknown(data['name2']!, _name2Meta));
    } else if (isInserting) {
      context.missing(_name2Meta);
    }
    if (data.containsKey('value1')) {
      context.handle(_value1Meta,
          value1.isAcceptableOrUnknown(data['value1']!, _value1Meta));
    } else if (isInserting) {
      context.missing(_value1Meta);
    }
    if (data.containsKey('value2')) {
      context.handle(_value2Meta,
          value2.isAcceptableOrUnknown(data['value2']!, _value2Meta));
    } else if (isInserting) {
      context.missing(_value2Meta);
    }
    if (data.containsKey('formula')) {
      context.handle(_formulaMeta,
          formula.isAcceptableOrUnknown(data['formula']!, _formulaMeta));
    } else if (isInserting) {
      context.missing(_formulaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Convertation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Convertation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name1'])!,
      name2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name2'])!,
      value1: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value1'])!,
      value2: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value2'])!,
      formula: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}formula'])!,
    );
  }

  @override
  $ConvertationsTable createAlias(String alias) {
    return $ConvertationsTable(attachedDatabase, alias);
  }
}

class Convertation extends DataClass implements Insertable<Convertation> {
  final String id;
  final String name1;
  final String name2;
  final int value1;
  final int value2;
  final int formula;
  const Convertation(
      {required this.id,
      required this.name1,
      required this.name2,
      required this.value1,
      required this.value2,
      required this.formula});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name1'] = Variable<String>(name1);
    map['name2'] = Variable<String>(name2);
    map['value1'] = Variable<int>(value1);
    map['value2'] = Variable<int>(value2);
    map['formula'] = Variable<int>(formula);
    return map;
  }

  ConvertationsCompanion toCompanion(bool nullToAbsent) {
    return ConvertationsCompanion(
      id: Value(id),
      name1: Value(name1),
      name2: Value(name2),
      value1: Value(value1),
      value2: Value(value2),
      formula: Value(formula),
    );
  }

  factory Convertation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Convertation(
      id: serializer.fromJson<String>(json['id']),
      name1: serializer.fromJson<String>(json['name1']),
      name2: serializer.fromJson<String>(json['name2']),
      value1: serializer.fromJson<int>(json['value1']),
      value2: serializer.fromJson<int>(json['value2']),
      formula: serializer.fromJson<int>(json['formula']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name1': serializer.toJson<String>(name1),
      'name2': serializer.toJson<String>(name2),
      'value1': serializer.toJson<int>(value1),
      'value2': serializer.toJson<int>(value2),
      'formula': serializer.toJson<int>(formula),
    };
  }

  Convertation copyWith(
          {String? id,
          String? name1,
          String? name2,
          int? value1,
          int? value2,
          int? formula}) =>
      Convertation(
        id: id ?? this.id,
        name1: name1 ?? this.name1,
        name2: name2 ?? this.name2,
        value1: value1 ?? this.value1,
        value2: value2 ?? this.value2,
        formula: formula ?? this.formula,
      );
  @override
  String toString() {
    return (StringBuffer('Convertation(')
          ..write('id: $id, ')
          ..write('name1: $name1, ')
          ..write('name2: $name2, ')
          ..write('value1: $value1, ')
          ..write('value2: $value2, ')
          ..write('formula: $formula')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name1, name2, value1, value2, formula);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Convertation &&
          other.id == this.id &&
          other.name1 == this.name1 &&
          other.name2 == this.name2 &&
          other.value1 == this.value1 &&
          other.value2 == this.value2 &&
          other.formula == this.formula);
}

class ConvertationsCompanion extends UpdateCompanion<Convertation> {
  final Value<String> id;
  final Value<String> name1;
  final Value<String> name2;
  final Value<int> value1;
  final Value<int> value2;
  final Value<int> formula;
  final Value<int> rowid;
  const ConvertationsCompanion({
    this.id = const Value.absent(),
    this.name1 = const Value.absent(),
    this.name2 = const Value.absent(),
    this.value1 = const Value.absent(),
    this.value2 = const Value.absent(),
    this.formula = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConvertationsCompanion.insert({
    required String id,
    required String name1,
    required String name2,
    required int value1,
    required int value2,
    required int formula,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name1 = Value(name1),
        name2 = Value(name2),
        value1 = Value(value1),
        value2 = Value(value2),
        formula = Value(formula);
  static Insertable<Convertation> custom({
    Expression<String>? id,
    Expression<String>? name1,
    Expression<String>? name2,
    Expression<int>? value1,
    Expression<int>? value2,
    Expression<int>? formula,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name1 != null) 'name1': name1,
      if (name2 != null) 'name2': name2,
      if (value1 != null) 'value1': value1,
      if (value2 != null) 'value2': value2,
      if (formula != null) 'formula': formula,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConvertationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name1,
      Value<String>? name2,
      Value<int>? value1,
      Value<int>? value2,
      Value<int>? formula,
      Value<int>? rowid}) {
    return ConvertationsCompanion(
      id: id ?? this.id,
      name1: name1 ?? this.name1,
      name2: name2 ?? this.name2,
      value1: value1 ?? this.value1,
      value2: value2 ?? this.value2,
      formula: formula ?? this.formula,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name1.present) {
      map['name1'] = Variable<String>(name1.value);
    }
    if (name2.present) {
      map['name2'] = Variable<String>(name2.value);
    }
    if (value1.present) {
      map['value1'] = Variable<int>(value1.value);
    }
    if (value2.present) {
      map['value2'] = Variable<int>(value2.value);
    }
    if (formula.present) {
      map['formula'] = Variable<int>(formula.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConvertationsCompanion(')
          ..write('id: $id, ')
          ..write('name1: $name1, ')
          ..write('name2: $name2, ')
          ..write('value1: $value1, ')
          ..write('value2: $value2, ')
          ..write('formula: $formula, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ConvertationsTable convertations = $ConvertationsTable(this);
  late final ConvertationDao convertationDao =
      ConvertationDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [convertations];
}
