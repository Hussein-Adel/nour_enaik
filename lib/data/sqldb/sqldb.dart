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
      treatment_image TEXT,
      doses_time_12H TEXT,
      doses_time_24H TEXT,
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

  Future<int> addAlarmToDataBase({required AlarmModel alarm}) async {
    String names =
        "treatment_name,treatment_image,doses_time_12H,doses_time_24H,alarm_status";
    String values =
        "'${alarm.treatmentName}','${alarm.treatmentImage}','${alarm.doseTime12H}','${alarm.doseTime24H}',${alarm.doseStatus?.value == true ? 1 : 0}";
    int response = await _addData('INSERT INTO alarm($names) VALUES($values)');
    print("response : $response");
    return response;
  }

  Future<List<AlarmModel>> getAlarmsFromDataBase() async {
    print("getAlarmsFromDataBase   <<<<<<< Start >>>>>>>  ");
    List<Map> response = await _geData('SELECT * FROM alarm');
    List<AlarmModel> alarms = [];
    for (var element in response) {
      alarms.add(AlarmModel(
        id: element['id'],
        treatmentName: element['treatment_name'],
        treatmentImage: element['treatment_image'],
        doseTime12H: element['doses_time_12H'],
        doseTime24H: element['doses_time_24H'],
        doseStatus: (element['alarm_status']! == 1).obs,
      ));
    }
    print(
        "Db response : $response <<<<<<<>>>>>>> cartComponent length : ${alarms.length}");
    return alarms;
  }

  updateAlarmIntoDataBase(AlarmModel dose) async {
    int response = await _updateData(
        "UPDATE alarm SET treatment_name = '${dose.treatmentName}',treatment_image = '${dose.treatmentImage}',doses_time_12H = '${dose.doseTime12H}',doses_time_24H = '${dose.doseTime24H}',alarm_status = '${dose.doseStatus?.value == true ? 1 : 0}' WHERE id = '${dose.id}'");
    print("response : $response");
  }

  deleteAlarmFromDataBase(int id) async {
    int response = await _deleteData('DELETE FROM alarm WHERE id = $id');
    print("response : $response");
  }
}
