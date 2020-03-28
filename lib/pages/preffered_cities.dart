import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/city_weather_model.dart';
import 'package:weather/weather-mobx/state_management.dart';

class PrefferedCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PrefferedCityState();
  }

}
class PrefferedCityState extends State<PrefferedCity>{


  @override
  Widget build(BuildContext context) {

        var provider =Provider.of<City>(context, listen: false);

    return Scaffold(
      appBar: GFAppBar(
        leading: GFIconButton(onPressed: () {
          Navigator.of(context).pop();
        }
        ,
          icon: Icon(FontAwesomeIcons.backward),
        ),
        title: Text("المدن المفضلة"),
      ),
body: Observer(builder: (BuildContext context) {
  return  GridView.count(
      crossAxisCount: 2,

    
    children: List.generate(provider.unique_prefferd.length, (index){
      final prefferdCity = provider.unique_prefferd[index];
      return  Observer(
        builder: (_){
          return  Stack(
    children: <Widget>[
       GFCard(
 boxFit: BoxFit.cover,
    image: Image.network('${prefferdCity.pic}'),
    title: GFListTile(
        avatar:GFAvatar(),
        title: Text('${prefferdCity.name}'),
        icon: GFIconButton(
            onPressed: null,
            icon: Icon(Icons.favorite_border),
            type: GFButtonType.transparent,
         )
     ),
     content:Text( "${prefferdCity.date}"),

      buttonBar: GFButtonBar(
        alignment:WrapAlignment.start,

      children: <Widget>[
        GFButton(
          onPressed: () {
            provider.deleteFromPreffed(prefferdCity);

          },
          text: 'أزالة',

         ),
       ],
     ),


       )
    ]
);
        },
      );
    }),

  );


},

),

    );
  }


}