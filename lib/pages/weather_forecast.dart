
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/weather_state.dart';

class Forecast extends StatefulWidget{
    final WeatherStateModel model; // Receive a model

  Forecast(this.model);

  @override
  State<StatefulWidget> createState() {
    return ForecastState();
  }

}

class ForecastState extends State<Forecast>{

  int selectedItem;
CityWeather selectedCity;

  @override
  void initState() {
widget.model.fetchUsers();


selectedItem =0;


super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final weatherState =
      ScopedModel.of<WeatherStateModel>(context, rebuildOnChange: true);
    return Text("knldl'gd'");
  }

}