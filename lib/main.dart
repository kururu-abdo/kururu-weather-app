import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/pages/category_selector.dart';
import 'package:weather/pages/city_details.dart';
import 'package:weather/pages/list_of_cities.dart';
import 'package:weather/pages/weather_forecast.dart';
import 'package:weather/weather-mobx/state_management.dart';
import 'package:weather/weather_state.dart';
import 'units/dependency_inversion.dart' as di;
Future<void> main()  async{
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Provider<City>(


      child: ScopedModel(
        model: WeatherStateModel(),
        child: MaterialApp(
          title: 'Weather',
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            primaryColor: Colors.teal[900],
            primarySwatch: Colors.teal,

          ),
          supportedLocales: [
            const Locale('ar', ''), // Arabic
            //const Locale('en', 'US'),
          ],

            localizationsDelegates: [
            //AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],

          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.countryCode == locale.countryCode &&
                  supportedLocale.languageCode == locale.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          routes: {
CityList.id:(context)=>CityList() ,
CityDetails.id:(context)=>CityDetails()
        }
          ,
          home: MyHomePage(),


        ),
      ),
      create: (BuildContext context) {
        return City();
    },
    );
  }
}

class MyHomePage extends StatefulWidget {





  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    CityWeather selectedCity;
    var detailsSize =MediaQuery.of(context).size.height;
final weatherState =
      ScopedModel.of<WeatherStateModel>(context, rebuildOnChange: true);

            var provider =Provider.of<City>(context, listen: false);

    return SafeArea(
      child: Scaffold(
         backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0.0,
       actions: <Widget>[
         IconButton(icon: Icon(FontAwesomeIcons.search),
         onPressed: (){

         },
         )
       ],
       centerTitle: true,
          title: Text("احوال الطقس"),
        ),
        body: Column(
          children: <Widget>[
            Category() ,
weatherState.tab=="today"?CityList(): Container(
  height: 50,
  child: DropdownButton<CityWeather>(
       onChanged: (CityWeather value){
         selectedCity=value;

       },
      value: selectedCity,
      items: weatherState.cities.map((CityWeather value){
        return DropdownMenuItem<CityWeather>(
          child: Row(
            children: <Widget>[
              Text(value.name ,style: TextStyle(color: Colors.white70),)
            ],
          ),
        );
      }).toList(),

     isExpanded: true,
    ),

)

          ],


        )
      ),
    );
  }
}
//Forecast(WeatherStateModel())