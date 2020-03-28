import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/appbar/gf_appbar.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/getflutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/pages/city_details.dart';
import 'package:weather/units/constants.dart';
import 'package:weather/units/details_args.dart';
import 'package:weather/weather-mobx/state_management.dart';
import 'package:weather/weatherBloc/weather_bloc.dart';
import 'package:weather/weather_state.dart';

class CityList extends StatefulWidget{
    static  String id= "list";


  @override
  State<StatefulWidget> createState() {
    return CityListState();
  }

}
class CityListState extends State<CityList>{
final List<String> categories =["طقس اليوم"  ,"التوقعات" ];
int selectedIndex;
    var bloc =weatherBloc();

  var _scaffoldKey =GlobalKey<ScaffoldState>();

final List<ReactionDisposer> _disposers = [];
addCity({BuildContext context ,CityWeather city} ){
    var provider =Provider.of<City>(context, listen: false);
    provider.addCities(city);
  }

@override
void dispose(){

  _disposers.forEach((disposer) => disposer());
  super.dispose();
}
@override
  void initState() {
      var provider =Provider.of<City>(context, listen: false);
provider.fetchData();
bloc.getCurrentWeather();
    // TODO: implement initState
    super.initState();
  }
changeIndex(int index){
  setState(() {

    selectedIndex=index;
  });
}
  @override
  Widget build(BuildContext context) {
final weatherState =
      ScopedModel.of<WeatherStateModel>(context, rebuildOnChange: true);
  var orientation  =MediaQuery.of(context).orientation;
//            var provider =Provider.of<City>(context, listen: false);
        final CityDetails args = ModalRoute.of(context).settings.arguments;
var detailsSize =MediaQuery.of(context).size.height;
//final weatherState =
//      ScopedModel.of<WeatherStateModel>(context, rebuildOnChange: true);

            var provider =Provider.of<City>(context, listen: false);

    return  Container(
              decoration: BoxDecoration(
                color:Colors.yellowAccent[300] ,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0) ,
                  topRight: Radius.circular(30.0)
                )
              ),
              child: Column(

                children: <Widget>[
               Container(
                 height: 120.0,
                 color: Colors.blueGrey,
                 child:     StreamBuilder<List<CityWeather>>(
      stream:bloc.cityWeather ,
builder: (BuildContext context, AsyncSnapshot<List<CityWeather>> snapshot) {

        if(snapshot.hasData) {
weatherState.addCity( snapshot.data);
          return ListView.builder(
            padding: EdgeInsets.only(right: 10.0),
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                childAspectRatio: (1 / 1),
//      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
              itemCount: snapshot.data.length,
			  scrollDirection: Axis.horizontal ,
              itemBuilder: (context, index) {

                  return GestureDetector(
child: Padding(
  padding: EdgeInsets.symmetric(horizontal:10.0),
  child:   Column(

    children: <Widget>[

      GFAvatar(

        radius: 35.0,

    backgroundImage:NetworkImage(snapshot.data[index].pic),

    shape: GFAvatarShape.standard

   ),

      Text(snapshot.data[index].name ,style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white30 ,letterSpacing: 1.0),) ,

      showTempr(snapshot.data[index].data)





    ],

  ),
),

                    onTap: () {
  weatherState.changeInitial(snapshot.data[index]);
//                      Navigator.of(context).pushNamed(
//                          CityDetails.id,
//                          arguments: DetailsArgs(snapshot.data[index].pic ,snapshot.data[index].name ,snapshot.data[index].date ,snapshot.data[index].data) );
                    },
                  );
                }
                );
                } else if(snapshot.hasError){
        return Text("${snapshot.error}");

} else{
                  return Center(
                    child: GFLoader(
   type:GFLoaderType.ios
 ),
                  );
                }
              }
          ),


               ) ,
Container(
  height: detailsSize/2,
  color: Colors.teal,
child: Stack(

  children: <Widget>[


    Positioned(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text( "اليوم:") ,
        Text(weatherState.day ) ,
          Text(weatherState.date ) ,
      ],
    ),
      right: 40.0,
      top: 10,

    ) ,
     Positioned(child: Text(weatherState.city_name ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w600),),
      left: 40.0,
      top: 10,

    ) ,
  Positioned(child:GFImageOverlay(
  height: 100,
  width: 100,

  image: NetworkImage(weatherState.image)
),
      left: 0.0,
      right: 150,
      top: 50,
    bottom: 0,

    ) ,



  ],
),


)

                ],
              ),

            );










  }

  Widget showTempr(String data) {
  var parsedData = json.decode(data);

double value  = (parsedData["main"]["temp"]  as double ) - 273.15;
var formattedValue= value.toString().substring(0,4);
  return Text('${formattedValue}  C');




  }

}