import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/units/constants.dart';

class WeatherStateModel extends Model{

 List<CityWeather>  cities =[];
static const Map<String , dynamic>initialData ={
"city_id": 2000,
"name": "الدمازين",
"lat": 11.77,
"lon": 34.35,
"pic": "https://live.staticflickr.com/2915/14618698816_a14d6864e6_b.jpg",
"state": "ولاية النيل الأزرق",
"date": "2020-03-27",
"data": """{"coord":{"lon":34.35,"lat":11.77},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"base":"stations","main":{"temp":311.85,"feels_like":307.92,"temp_min":311.85,"temp_max":311.85,"pressure":1005,"humidity":9,"sea_level":1005,"grnd_level":954},"wind":{"speed":2.81,"deg":46},"clouds":{"all":97},"dt":1585295100,"sys":{"country":"SD","sunrise":1585280526,"sunset":1585324408},"timezone":7200,"id":380174,"name":"Ad-Damazin","cod":200}""",
};
 static String  dateString = initialData["data"];

dynamic _data = dateString;
dynamic get data => data;
int _selectedIndex=0;
int get selectedIndex =>_selectedIndex;


String _city_name =initialData["name"];
String get city_name =>_city_name;
String _image =initialData["pic"];
String get image => _image;
String get day =>getDay();


String _date = initialData["date"];
String get date =>_date;
getDay(){
  var d;
  DateTime dateTime =DateTime.parse(date);
  switch(dateTime.weekday){
    case 1:
    {
        d ="الاتنين";
    }
      break;
   case 2:
    {
        d ="الثلاثاء";
    }
      break;
      case 3:
      {
        d ="الاربعاء";
      }
      break;
      case 4:
      {
        d ="الخميس";
      }
      break;
      case 5:
      {
        d ="الجمعة";
      }
      break;
      case 6:{
        d ="السبت";
      }

      break;
      case 7:
     {
        d ="الاحد";
     }
      break;
    default:{

    }
    break;



  }


  return d;
}
String _tab ="today";
String get tab =>_tab;

changeIndex(int index){
  _selectedIndex=index;
  notifyListeners();
  if(_selectedIndex==0){
    _tab="today";
    notifyListeners();
  }else{
    _tab ="forecast";
    notifyListeners();
  }



}

swapTab(int selectedIndex){
  if(selectedIndex==0){
    _tab="today";
    notifyListeners();
  }else{
    _tab="forecast";
    notifyListeners();
  }

}
void fetchUsers() async {
    try {
      http.Response response = await http.get('$url/current');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable i = json.decode(response.body);

        cities = i.map((model) => CityWeather.fromJson(model)).toList();
        notifyListeners();
      }
    } catch (error) {
      print(error);
    } }
void addCity(List<CityWeather> city){

  cities=city;
  notifyListeners();

}
void changeInitial(CityWeather city){
  _city_name =city.name;
  notifyListeners();
  _date =city.date;
  notifyListeners();
  _image =city.pic;
  notifyListeners();


}


static   WeatherStateModel of(BuildContext context)=>  ScopedModel.of<WeatherStateModel>(context);
}

