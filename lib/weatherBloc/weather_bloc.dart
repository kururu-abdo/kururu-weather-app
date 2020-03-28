import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/repository/weather_repository.dart';

class weatherBloc{
  var repo = GetIt.instance<Weather_repository>();



  BehaviorSubject<List<CityWeather>> _cityWeather = new   BehaviorSubject<List<CityWeather>> ();

  Stream<List<CityWeather>>   get cityWeather =>  _cityWeather.stream;




  Future<List<CityWeather>> getCurrentWeather() async{
    var data = await repo.getCurrentWeather();
    print(data);
    _cityWeather.sink.add(data);



  }





}