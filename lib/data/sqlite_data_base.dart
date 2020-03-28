import 'dart:async';
import 'dart:io' as io;
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/units/constants.dart';

class DBHelper {
  static Database _db;
 static const String city_id  ="city_id";
 static const String city_name  ="city_name";
 static const String state  ="state";
 static const String lat  ="lat";
 static const String lon  ="lon";
 static const String pic  ="pic";
    static const String CurrentWeather = 'weather';

    static const String dateId  ="date_id";
    static const String data  ="data";
    static const String CityTable = 'city';
        static const String CityWeatherTable = 'cityweather';
    static const String id = 'city_id';
 static const String name  ="city_name";
 static const String city_state  ="state";
 static const String city_lat  ="lat";
 static const String city_lon  ="lon";
 static const String city_pic  ="pic";

    static const String city_date  ="date";
    static const String city_data  ="data";
  static const String DB_NAME = 'weather.db';
  // DBHelper._privateConstructor();
  //   static final DBHelper instance = DBHelper._privateConstructor();
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 6, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    try {

       await db.execute(
          "CREATE TABLE $CurrentWeather ($dateId TEXT PRIMARY KEY )");
 await db.execute(
          "CREATE TABLE $CityWeatherTable ($id INTEGER PRIMARY KEY ,$name TEXT   ,$city_state  TEXT  ,$city_pic TEXT $city_lat REAL ,$city_lon  REAL , $city_date  TEXT ,$city_data TEXT)");

      await db.execute(
          "CREATE TABLE $CityTable ($city_id INTEGER PRIMARY KEY ,$city_name TEXT   ,$state  TEXT  ,$pic TEXT $lat REAL ,$lon  REAL )");
    } on DatabaseException {
      throw Exception();
    }
  }

  Future<List<CityModel>> getCityData(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(DBHelper.CityTable, where: "city_id=?", whereArgs: [id]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM location WHERE type= $locationTypetype");

    List<CityModel> cities = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        cities.add(CityModel.fromJson(maps[i]));
      }
    }
    return cities;
  }

   Future<CityWeather> getCityWeather(int id) async {
    var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(now);
  print(formatted);
    var dbClient = await db;
//    List<Map> maps = await dbClient
//        .query(DBHelper.CurrentWeather, where: "date_id=? ", whereArgs: ["[$date ,$id]"]);
    List<Map> maps = await dbClient.query("SELECT * FROM cityweather  when city_id = $id AND date =${formatted}");

   CityWeather cities;


        cities=CityWeather.fromJson(maps[0]);


    return cities;
  }

Future<List<CityWeather>> getCurrentWeather() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(DBHelper.CurrentWeather);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM location WHERE type= $locationTypetype");

    List<CityWeather> data = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        data.add(CityWeather.fromJson(maps[i]));
      }
    }
    return data;
  }
  Future<List<CityModel>> search(String str) async {
    var dbClient = await db;

    List<Map> maps = await dbClient.query(DBHelper.CityTable,
        where: "city_name LIKE ? ", whereArgs: ["%$str%"]);
//List<Map> maps = await dbClient.rawQuery("SELECT * FROM $DB_NAME WHERE $location_name LIKE  '%$str'  " );

    List<CityModel> cities = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        cities.add(CityModel.fromJson(maps[i]));

        print("inside search zone");
      }
    }
    return cities;
  }

  Future<List<CityModel>> getAllCites() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(DBHelper.CityTable);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<CityModel> cities = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        cities.add(CityModel.fromJson(maps[i]));
      }
    }
    return cities;
  }

  Future<CityModel> saveCity(CityModel model) async {
    var dbClient = await db;
    var result = await dbClient.insert(CityTable, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return model;

    // await dbClient.transaction((txn) async {
    //   var query = " INSERT INTO $TABLE ($location_id  ,$location_name ,$state , $type ,$pic ,$description ,$lat ,$lon ) VALUES (${model.locationId}  ,${model.locationName} ,${model.state} , ${model.type} ,${model.pic} ,${model.description} , ${model.lat} ,${model.longitude} ) "   ;
    //   return await txn.rawInsert(query );
    // });
  }

   Future<CityWeather> saveCityWeather(CityWeather model) async {
    var dbClient = await db;
    var result = await dbClient.insert(CityWeatherTable, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return model;

    // await dbClient.transaction((txn) async {
    //   var query = " INSERT INTO $TABLE ($location_id  ,$location_name ,$state , $type ,$pic ,$description ,$lat ,$lon ) VALUES (${model.locationId}  ,${model.locationName} ,${model.state} , ${model.type} ,${model.pic} ,${model.description} , ${model.lat} ,${model.longitude} ) "   ;
    //   return await txn.rawInsert(query );
    // });
  }

   Future<current_weather> saveWeatherData(current_weather model) async {
    var dbClient = await db;
    var result = await dbClient.insert(CurrentWeather, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return model;

    // await dbClient.transaction((txn) async {
    //   var query = " INSERT INTO $TABLE ($location_id  ,$location_name ,$state , $type ,$pic ,$description ,$lat ,$lon ) VALUES (${model.locationId}  ,${model.locationName} ,${model.state} , ${model.type} ,${model.pic} ,${model.description} , ${model.lat} ,${model.longitude} ) "   ;
    //   return await txn.rawInsert(query );
    // });
  }



  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
