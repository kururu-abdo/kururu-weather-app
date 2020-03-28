
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repository/weather_repository.dart';
import 'package:weather/units/constants.dart';

part 'state_management.g.dart';


class City = _City  with _$City;
abstract class _City with Store{


@observable
ObservableList<CityWeather>  _cities =ObservableList<CityWeather> ();
ObservableList<CityWeather>   get cities=>_cities;
@observable
ObservableList<CityModel> _search_result =ObservableList<CityModel>();
  ObservableList<CityModel> get search_result => _search_result;


  @observable
CityWeather _cityweather =CityWeather();
  CityWeather get cityweather =>_cityweather;

  @observable
  ObservableList<CityWeather>  _prefferedCities = ObservableList<CityWeather> ();
  ObservableList<CityWeather> get preffered_cities =>_prefferedCities;

//ObservableList<current_weather>  _current =ObservableList<current_weather> ();
//
//  ObservableList<current_weather>  get current => _current;
bool _showSwappDialog =true;
bool get showSwappDialog => _showSwappDialog;

  @computed
  ObservableList<CityWeather>  get unique_prefferd =>ObservableList.of(_prefferedCities).toSet().toList();




  @action
  void deleteFromPreffed(CityWeather cityWeather){
    _prefferedCities.remove(cityWeather);
  }

@action
void addTopreffered(CityWeather city){
  if(_prefferedCities.length<5){
    _prefferedCities.add(city);
  }{
_showSwappDialog= true;
  }
}
@action
CityWeather cityDetail(CityWeather city){
  return city;
}

@action
void addCities(CityWeather cityWeather){
    _cities.add(cityWeather);
}

@action
   fetchData() async{
    var repo = GetIt.instance<Weather_repository>();
  // _cities= await repo.getCurrentWeather();


  }


   List<CityWeather> cityWither = [];
@action
   fetchUsers() async {
    try {
      http.Response response = await http.get('$url/current');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Iterable i = json.decode(response.body);

        _cities = i.map((model) => CityWeather.fromJson(model)).toList();
      }
    } catch (error) {
      print(error);
    } }

}