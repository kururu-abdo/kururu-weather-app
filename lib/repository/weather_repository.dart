import 'package:weather/data/local_Data_sources.dart';
import 'package:weather/data/remote_data_sources.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/city_details.dart';
import 'package:weather/units/network_info.dart';

abstract class Weather_repository{
Future<List<CityModel> > getCities();
Future<CityWeather > getCityWeatherData(int id);
Future<List<CityModel> >  search(String str);
Future<List<CityWeather>>  getCurrentWeather();


}


class Weather_Repository_Impl implements Weather_repository{
  final NetworkInfo info ;
  final LocalContract local;
  final RemoteContract remote;

  Weather_Repository_Impl(this.info, this.local, this.remote);


  @override
  Future<List<CityModel>> getCities() async{
    List<CityModel> cities ;
   if(await info.isConnected){

   }else{
     cities=  await local.getAllCities();
   }
   return cities;
  }

  @override
  Future<CityWeather> getCityWeatherData(int id)  async{
    CityWeather cityWeather;
  if( await info.isConnected){
    cityWeather = await remote.getCityWeatherData(id);
  }else{
    cityWeather = await local.getCityWeatherData(id);
  }
  return cityWeather;
  }

  @override
  Future<List<CityWeather>> getCurrentWeather()  async{
    List<CityWeather> current;

    if(await  info.isConnected){
      current = await remote.getCurrentWeather();
    }else{
      current = await local.getCurrentWeather();
    }
    return current;
  }

  @override
  Future<List<CityModel>> search(String str)  async{
   List<CityModel>  cities ;
   if(await info.isConnected){
     cities = await remote.search(str);
   }else{
     cities =await local.search(str);
   }
   return cities;
  }



}