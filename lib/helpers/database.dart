import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'tasked_files.sqlite'));
    return VmDatabase(file);
  });
}

class Tasktables extends Table {
  // IntColumn get id => integer().autoIncrement()();
  TextColumn get taskDescription => text()();
  BoolColumn get taskComplete => boolean()();
  @override
  Set<Column> get primaryKey => {taskDescription};
}

@UseMoor(tables: [Tasktables])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  Future insertTask(Tasktable task) => into(tasktables).insert(task);
  Future deleteTask(Tasktable task) => delete(tasktables).delete(task);
  Future<List<Tasktable>> getAllTasks() => select(tasktables).get();
  Future deleteAllTasks() => delete(tasktables).go();
  Future updateTask(Insertable<Tasktable> task) =>
      update(tasktables).replace(task);

  //Future deleteAllTasks() => delete(tasktables)
}
