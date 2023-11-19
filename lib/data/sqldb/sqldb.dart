import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../controllers/dosing_schedules_controller.dart';

class SqlDb {
  Future<Database?> get cartDatabase async {
    if (_database == null) {
      _database = await _initialDb();
      return _database;
    } else {
      return _database;
    }
  }

  static Database? _database;
  _initialDb() async {
    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, 'nour_enaik.db');
    Database database =
        await openDatabase(path, onCreate: _onCreate, version: 1);
    return database;
  }

  _onCreate(Database database, int version) async {
    print(
        "================================== ON CREATE ================================================");
    await database.execute('''
    CREATE TABLE alarm (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      treatment_name TEXT,
      doses_time TEXT,
      alarm_status INTEGER
      )
    ''');
  }

  Future<List<Map>> _geData(String sql) async {
    Database? myDatabase = await cartDatabase;
    List<Map> response = await myDatabase!.rawQuery(sql);
    return response;
  }

  Future<int> _addData(String sql) async {
    Database? myDatabase = await cartDatabase;
    int response = await myDatabase!.rawInsert(sql);
    return response;
  }

  Future<int> _updateData(String sql) async {
    Database? myDatabase = await cartDatabase;
    int response = await myDatabase!.rawUpdate(sql);
    return response;
  }

  Future<int> _deleteData(String sql) async {
    Database? myDatabase = await cartDatabase;
    int response = await myDatabase!.rawDelete(sql);
    return response;
  }

  Future<int> addAlarmToDataBase({required DoseModel dose}) async {
    String names = "treatment_name, doses_time,alarm_status";
    String values =
        "'${dose.treatmentName}','${dose.doseTime}',${dose.doseStatus?.value == true ? 1 : 0}";
    int response = await _addData('INSERT INTO alarm($names) VALUES($values)');
    print("response : $response");
    return response;
  }

  Future<List<DoseModel>> getAlarmsFromDataBase() async {
    print("getAlarmsFromDataBase   <<<<<<< Start >>>>>>>  ");
    List<Map> response = await _geData('SELECT * FROM alarm');
    List<DoseModel> alarms = [];
    for (var element in response) {
      alarms.add(DoseModel(
        treatmentName: element['treatment_name'],
        doseTime: element['doses_time'],
        doseStatus: (element['alarm_status']! == 1).obs,
      ));
    }
    print(
        "Db response : $response <<<<<<<>>>>>>> cartComponent length : ${alarms.length}");
    return alarms;
  }

  updateAlarmIntoDataBase(DoseModel dose) async {
    int response = await _updateData(
        'UPDATE alarm SET treatment_name = ${dose.treatmentName},doses_time = ${dose.doseTime},alarm_status = ${dose.doseStatus?.value == true ? 1 : 0}, WHERE id = ${dose.id}');
    print("response : $response");
  }

  deleteAlarmFromDataBase(int id) async {
    int response = await _deleteData('DELETE FROM alarm WHERE id = $id');
    print("response : $response");
  }
}
