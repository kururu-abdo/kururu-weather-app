class CityWeather {
  int cityId;
  String name;
  String state;
 double lat;
 double  lon;
  String pic;
  String date;
  String data;

  CityWeather(
      {this.cityId,
      this.name,
      this.state,
      this.lat,
      this.lon,
      this.pic,
      this.date,
      this.data});

  CityWeather.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'] ;
    name = json['name'];
    state = json['state'];
    lat = json['lat']  ;
    lon = json['lon'];
    pic = json['pic'].toString().trim();
    date = json['date'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['name'] = this.name;
    data['state'] = this.state;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['pic'] = this.pic;
    data['date'] = this.date;
    data['data'] = this.data;
    return data;
  }
}