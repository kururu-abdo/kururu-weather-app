import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:weather/units/details_args.dart';

class CityDetails extends StatelessWidget{
  static  String id= "detail";
  final image ;
  final city_name;
  final data;
  final date;

  const CityDetails({Key key, this.image, this.city_name, this.data, this.date}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final DetailsArgs args = ModalRoute.of(context).settings.arguments;
    return  Center(
          child:
              Hero(
                tag: "${args.image}+${args.city_name}",
                placeholderBuilder: (context,size ,widget){
                  return Container(
                    height: 300.0,
                    width: 300.0,
                    child: CircularProgressIndicator(),
                  );
                },
                child: Container(


                    child: Image.network(args.image))),






        );

  }
  
  
}