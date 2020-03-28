class current_weather {
  String data;
  List<String> dateId;

  current_weather({this.data, this.dateId});

  current_weather.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    dateId = json['date_id'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['date_id'] = this.dateId;
    return data;
  }
}