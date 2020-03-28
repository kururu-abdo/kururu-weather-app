import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather/weather_state.dart';

class Category extends StatefulWidget{
    static  String id= "list";


  @override
  State<StatefulWidget> createState() {
    return CategoryState();
  }

}
class CategoryState extends State<Category>{
final List<String> categories =["طقس اليوم"  ,"التوقعات" ];
int selectedIndex;
changeIndex(int index){
  setState(() {

    selectedIndex=index;
  });
}

@override
  void initState() {
   selectedIndex=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  var model = ScopedModel.of<WeatherStateModel>(context ,rebuildOnChange: true);

     return Container(
height: 90,
color:Theme.of(context).primaryColor,
child: ListView.builder(

    itemCount: categories.length,
    scrollDirection: Axis.horizontal,

    itemBuilder: (context ,index){
return GestureDetector(
  onTap: (){
setState(() {
      selectedIndex =index;
      model.changeIndex(index);
});
  },

child: Padding(
padding: EdgeInsets.symmetric(horizontal: 20.0 ,vertical: 30.0),
child: Text(categories[index] ,style: TextStyle(color: index==selectedIndex?Colors.white:Colors.white24 ,fontSize: 24.0 ,letterSpacing: 1.2,fontWeight: FontWeight.bold),),

),

);
}),



);

  }



}