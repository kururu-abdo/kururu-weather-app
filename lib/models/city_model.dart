class CityModel {
  int cityId;
  String lat;
  String lon;
  String name;
  String pic;
  String state;

  CityModel({this.cityId, this.lat, this.lon, this.name, this.pic, this.state});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    lat = json['lat'];
    lon = json['lon'];
    name = json['name'];
    pic = json['pic'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['name'] = this.name;
    data['pic'] = this.pic;
    data['state'] = this.state;
    return data;
  }
}