import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'package:intl/intl.dart';

import 'package:meta/meta.dart';
import 'package:weather/data/local_Data_sources.dart';
import 'package:weather/data/sqlite_data_base.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/units/constants.dart';
import 'package:weather/units/dio_ineterceptor.dart';
import 'package:weather/units/dio_request_retrier.dart';

abstract class RemoteContract {

 Future<List<CityModel>> getCity(int id);

  Future<List<CityModel>> getAllCities();

  Future<List<CityModel>> search(String str);

  Future<List<CityWeather>> getCurrentWeather();

Future<CityWeather>  getCityWeatherData(int id);

}

class Remote implements RemoteContract {
  final LocalContract loc;
  final Client  http;

  Remote({@required this.http, @required this.loc});
var db =DBHelper();

  @override
  Future<List<CityModel>> getAllCities() async{
    List<CityModel> cities;

try{
      var response =  await http.get("${url}/city");
Iterable i = json.decode(response.body);
cities =i.map((model)=>CityModel.fromJson(model));

i.map((model){
  db.saveCity(model);
});
//dio.interceptors.add(
//      RetryOnConnectionChangeInterceptor(
//        requestRetrier: DioConnectivityRequestRetrier(
//          dio: dio,
//          connectivity: Connectivity(),
//        ),
//      ),
//    );
} on SocketException{
  throw Exception();
}






    
    
    return cities;
  }

  @override
  Future<List<CityModel>> getCity(int id)  async{
 List<CityModel> cities;
try{
      var response =  await http.post("${url}/city/data" ,

      );
Iterable i = json.decode(response.body);
cities =i.map((model)=>CityModel.fromJson(model));
//dio.interceptors.add(
//      RetryOnConnectionChangeInterceptor(
//        requestRetrier: DioConnectivityRequestRetrier(
//          dio: dio,
//          connectivity: Connectivity(),
//        ),
//      ),
//    );


} on SocketException{
  throw Exception();
}








    return cities;
  }

  @override
  Future<List<CityWeather>> getCurrentWeather() async{
   List<CityWeather> weaatherData;
   try{
       var  response =  await http.get("$url/current" ,
      );
Iterable i = json.decode(response.body);
weaatherData =i.map((model)=>CityWeather.fromJson(model)).toList();
print("the data here is $weaatherData");
i.map((model){
  db.saveWeatherData(model);
});
// dio.interceptors.add(
//      RetryOnConnectionChangeInterceptor(
//        requestRetrier: DioConnectivityRequestRetrier(
//          dio: dio,
//          connectivity: Connectivity(),
//        ),
//      ),
//    );

} on SocketException{
  throw Exception();
}



    return weaatherData;
  }



  @override
  Future<List<CityModel>> search(String str)  async{
  List<CityModel> cities;
try{
      var response =  await http.post("$url/city/search" ,

      );
Iterable i = json.decode(response.body);
cities =i.map((model)=>CityModel.fromJson(model));

//dio.interceptors.add(
//      RetryOnConnectionChangeInterceptor(
//        requestRetrier: DioConnectivityRequestRetrier(
//          dio: dio,
//          connectivity: Connectivity(),
//        ),
//      ),
//    );

} on SocketException{
  throw Exception();
}








    return cities;
  }



  @override
  Future<CityWeather> getCityWeatherData(int id) async {
    var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(now);
  print(formatted);


CityWeather cityWeather;
try{
      var response =  await http.post("$url/city/data" ,

      );
var i = json.decode(response.body);
cityWeather =CityWeather.fromJson(i);

//
//dio.interceptors.add(
//      RetryOnConnectionChangeInterceptor(
//        requestRetrier: DioConnectivityRequestRetrier(
//          dio: dio,
//          connectivity: Connectivity(),
//        ),
//      ),
//    );
} on SocketException{
  throw Exception();
}








    return cityWeather;



  }
//
//  @override
//  Future<List<LocationModel>> getLocationByType(String type) async {
//    try {
//      var response = await client.get("$GET_TYPE_URL/location?type=$type");
//
//      if (response.statusCode == 200 || response.statusCode == 201) {
//        Iterable l = json.decode(response.body);
//        List<LocationModel> locations =
//            l.map((model) => LocationModel.fromJson(model)).toList();
//
//        return locations;
//      } else {
//        return loc.getLocationByType(type);
//      }
//    } on Exception {
//      throw Exception("the are a problem with the internet or the server");
//    }
//  }
//
//  Future<List<LocationModel>> getAllLocations() async {
//    var response = await client.get("$GET_ALL_URL/location");
//
//    if (response.statusCode == 200 || response.statusCode == 201) {
//      Iterable l = json.decode(response.body);
//      List<LocationModel> locations =
//          l.map((model) => LocationModel.fromJson(model)).toList();
//
//      return locations;
//    } else {
//      return loc.getAllLocation();
//    }
//  }
//
//  @override
//  Future<List<LocationModel>> search(String str) async {
//    var response = await client.get("$SEARCH_URL/search?name=$str");
//
//    if (response.statusCode == 200 || response.statusCode == 201) {
//      Iterable l = json.decode(response.body);
//      List<LocationModel> locations =
//          l.map((model) => LocationModel.fromJson(model)).toList();
//
//      return locations;
//    } else {
//      return loc.search(str);
//    }
//  }
//
//  @override
//  Future<CurrentWeather> getCurrentWeather(double lat, double lon) async {
//     var response = await client.get("http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&APPID=$weather_api_key");
//
//    if (response.statusCode == 200 || response.statusCode == 201) {
//
//      CurrentWeather weather = CurrentWeather.fromJson(json.decode(response.body));
//
//
//      return weather;
//    } else {
//      return null;
//    }
//  }
}
