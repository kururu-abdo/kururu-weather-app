

import 'package:weather/data/sqlite_data_base.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/models/weather_model.dart';

abstract class LocalContract {
  cachCityeData(CityModel data);
  cacheWeatherData(current_weather data);
  Future<List<CityModel>> getCity(int id);

  Future<List<CityModel>> getAllCities();

  Future<List<CityModel>> search(String str);

  Future<List<CityWeather>> getCurrentWeather();
Future<CityWeather> getCityWeatherData(int id);


}

class Local implements LocalContract {
  // var myMap =Map<String  , Future<List<LocationModel>>>();
  var database = new DBHelper();
  @override
  Future<List<CityModel>> getCity(int id) async {
    print("get from the local");

    var sql =
        """SELECT * from ${DBHelper.CityTable} where ${DBHelper.city_id} ==$id """;

    List<CityModel> cities = List<CityModel>();
    //  for (final loc in data2) {
    //    final location =LocationModel.fromJson(loc);
    //    locations.add(location);
    //  }
    cities = await database.getCityData(id);

    return cities;
  }

  @override
  cachCityeData(CityModel data) async {
//myMap[type]=data;
//data.then((value) =>value.map((f)=>dao.insert(f)));
    print("insideide local  data @@ ");
    database.saveCity(data);

  }
  @override
  cacheWeatherData(current_weather data) async {
//myMap[type]=data;
//data.then((value) =>value.map((f)=>dao.insert(f)));
    print("insideide local  data @@ ");
    database.saveWeatherData(data);

  }


  @override
  Future<List<CityModel>> getAllCities() async {
    var sql = """SELECT * from ${DBHelper.CityTable} """;

    final data = await database.getAllCites();
    List<CityModel> cities = List();
    cities = await database.getAllCites();
    return cities;
  }

  @override
   Future<List<CityModel>> search(String str) async {
    List<CityModel> cities = List<CityModel>();
    //  for (final loc in data2) {
    //    final location =LocationModel.fromJson(loc);
    //    locations.add(location);
    //  }
    cities = await database.search(str);

    return cities;
  }

  @override
  Future<List<CityWeather>> getCurrentWeather() async{
      var sql = """SELECT * from ${DBHelper.CurrentWeather} """;

    final data = await database.getCurrentWeather();
    List<CityWeather> weather = List();
    weather = await database.getCurrentWeather();
    return weather;
  }

  @override
  Future<CityWeather> getCityWeatherData(int id)  async{
   CityWeather cityWeather;
    cityWeather = await database.getCityWeather(id);
    return cityWeather;
  }
}
