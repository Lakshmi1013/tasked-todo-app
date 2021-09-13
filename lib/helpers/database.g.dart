// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Tasktable extends DataClass implements Insertable<Tasktable> {
  final String taskDescription;
  final bool taskComplete;
  Tasktable({@required this.taskDescription, @required this.taskComplete});
  factory Tasktable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Tasktable(
      taskDescription: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_description']),
      taskComplete: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_complete']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || taskDescription != null) {
      map['task_description'] = Variable<String>(taskDescription);
    }
    if (!nullToAbsent || taskComplete != null) {
      map['task_complete'] = Variable<bool>(taskComplete);
    }
    return map;
  }

  TasktablesCompanion toCompanion(bool nullToAbsent) {
    return TasktablesCompanion(
      taskDescription: taskDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(taskDescription),
      taskComplete: taskComplete == null && nullToAbsent
          ? const Value.absent()
          : Value(taskComplete),
    );
  }

  factory Tasktable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tasktable(
      taskDescription: serializer.fromJson<String>(json['taskDescription']),
      taskComplete: serializer.fromJson<bool>(json['taskComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskDescription': serializer.toJson<String>(taskDescription),
      'taskComplete': serializer.toJson<bool>(taskComplete),
    };
  }

  Tasktable copyWith({String taskDescription, bool taskComplete}) => Tasktable(
        taskDescription: taskDescription ?? this.taskDescription,
        taskComplete: taskComplete ?? this.taskComplete,
      );
  @override
  String toString() {
    return (StringBuffer('Tasktable(')
          ..write('taskDescription: $taskDescription, ')
          ..write('taskComplete: $taskComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(taskDescription.hashCode, taskComplete.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tasktable &&
          other.taskDescription == this.taskDescription &&
          other.taskComplete == this.taskComplete);
}

class TasktablesCompanion extends UpdateCompanion<Tasktable> {
  final Value<String> taskDescription;
  final Value<bool> taskComplete;
  const TasktablesCompanion({
    this.taskDescription = const Value.absent(),
    this.taskComplete = const Value.absent(),
  });
  TasktablesCompanion.insert({
    @required String taskDescription,
    @required bool taskComplete,
  })  : taskDescription = Value(taskDescription),
        taskComplete = Value(taskComplete);
  static Insertable<Tasktable> custom({
    Expression<String> taskDescription,
    Expression<bool> taskComplete,
  }) {
    return RawValuesInsertable({
      if (taskDescription != null) 'task_description': taskDescription,
      if (taskComplete != null) 'task_complete': taskComplete,
    });
  }

  TasktablesCompanion copyWith(
      {Value<String> taskDescription, Value<bool> taskComplete}) {
    return TasktablesCompanion(
      taskDescription: taskDescription ?? this.taskDescription,
      taskComplete: taskComplete ?? this.taskComplete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskDescription.present) {
      map['task_description'] = Variable<String>(taskDescription.value);
    }
    if (taskComplete.present) {
      map['task_complete'] = Variable<bool>(taskComplete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasktablesCompanion(')
          ..write('taskDescription: $taskDescription, ')
          ..write('taskComplete: $taskComplete')
          ..write(')'))
        .toString();
  }
}

class $TasktablesTable extends Tasktables
    with TableInfo<$TasktablesTable, Tasktable> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasktablesTable(this._db, [this._alias]);
  final VerificationMeta _taskDescriptionMeta =
      const VerificationMeta('taskDescription');
  GeneratedColumn<String> _taskDescription;
  @override
  GeneratedColumn<String> get taskDescription => _taskDescription ??=
      GeneratedColumn<String>('task_description', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _taskCompleteMeta =
      const VerificationMeta('taskComplete');
  GeneratedColumn<bool> _taskComplete;
  @override
  GeneratedColumn<bool> get taskComplete => _taskComplete ??=
      GeneratedColumn<bool>('task_complete', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: true,
          defaultConstraints: 'CHECK (task_complete IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [taskDescription, taskComplete];
  @override
  String get aliasedName => _alias ?? 'tasktables';
  @override
  String get actualTableName => 'tasktables';
  @override
  VerificationContext validateIntegrity(Insertable<Tasktable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_description')) {
      context.handle(
          _taskDescriptionMeta,
          taskDescription.isAcceptableOrUnknown(
              data['task_description'], _taskDescriptionMeta));
    } else if (isInserting) {
      context.missing(_taskDescriptionMeta);
    }
    if (data.containsKey('task_complete')) {
      context.handle(
          _taskCompleteMeta,
          taskComplete.isAcceptableOrUnknown(
              data['task_complete'], _taskCompleteMeta));
    } else if (isInserting) {
      context.missing(_taskCompleteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {taskDescription};
  @override
  Tasktable map(Map<String, dynamic> data, {String tablePrefix}) {
    return Tasktable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasktablesTable createAlias(String alias) {
    return $TasktablesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasktablesTable _tasktables;
  $TasktablesTable get tasktables => _tasktables ??= $TasktablesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasktables];
}
