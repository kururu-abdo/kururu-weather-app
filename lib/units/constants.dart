const url ="http://localhost:3000";
const cities =[
{
"city_id": 1000,
"lat": "15.552",
"lon": "32.532",
"name": "الخرطوم",
"pic": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Khartoum.jpg/220px-Khartoum.jpg",
"state": "ولاية الخرطوم"
},
{
"city_id": 1001,
"lat": "12.049",
"lon": "24.881",
"name": "نيالا",
"pic": "https://i.ytimg.com/vi/VucEWbOidNw/hqdefault.jpg",
"state": "ولاية جنوب دارفور"
},
{
"city_id": 2005,
"lat": "13.450",
"lon": "22.440",
"name": "الجنينة",
"pic": "https://global.unitednations.entermediadb.net/assets/mediadb/services/module/asset/downloads/preset/Libraries/Production+Library/03-01-2020_UNAMID_West-Darfur.jpg/image1170x530cropped.jpg",
"state": "ولاية غرب دارفور"
},
{
"city_id": 3001,
"lat": "11.330",
"lon": "27.800",
"name": "بابنوسة",
"pic": "https://i.ytimg.com/vi/svWHtlsM0Z8/maxresdefault.jpg",
"state": "ولاية غرب كردفان"
}];

const cityWeather =[
{
"data": "{\"coord\":{\"lon\":26.13,\"lat\":11.46},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":300.78,\"feels_like\":294.68,\"temp_min\":300.78,\"temp_max\":300.78,\"pressure\":1010,\"humidity\":12,\"sea_level\":1010,\"grnd_level\":955},\"wind\":{\"speed\":5.09,\"deg\":37},\"clouds\":{\"all\":99},\"dt\":1584907539,\"sys\":{\"country\":\"SD\",\"sunrise\":1584850692,\"sunset\":1584894375},\"timezone\":7200,\"id\":408660,\"name\":\"Southern Darfur\",\"cod\":200}",
"date_id": [
"2020-03-22",
2002
]
}
];


const weather =[

  {
"data": "{\"coord\":{\"lon\":33.52,\"lat\":14.4},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",\"main\":{\"temp\":298.48,\"feels_like\":292.28,\"temp_min\":298.48,\"temp_max\":298.48,\"pressure\":1012,\"humidity\":12,\"sea_level\":1012,\"grnd_level\":964},\"wind\":{\"speed\":4.96,\"deg\":10},\"clouds\":{\"all\":0},\"dt\":1584907536,\"sys\":{\"country\":\"SD\",\"sunrise\":1584848907,\"sunset\":1584892614},\"timezone\":7200,\"id\":364103,\"name\":\"Wad Medani\",\"cod\":200}",
"date_id": [
"2020-03-22",
2001
]
},
{
"data": "{\"coord\":{\"lon\":37.22,\"lat\":19.62},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",\"main\":{\"temp\":290.08,\"feels_like\":289.75,\"temp_min\":290.08,\"temp_max\":290.08,\"pressure\":1015,\"humidity\":75,\"sea_level\":1015,\"grnd_level\":973},\"wind\":{\"speed\":1.56,\"deg\":350},\"clouds\":{\"all\":3},\"dt\":1584907537,\"sys\":{\"country\":\"SD\",\"sunrise\":1584847995,\"sunset\":1584891750},\"timezone\":7200,\"id\":377039,\"name\":\"Port Sudan\",\"cod\":200}",
"date_id": [
"2020-03-22",
1002
]
},
{
"data": "{\"coord\":{\"lon\":33.93,\"lat\":13.15},\"weather\":[{\"id\":801,\"main\":\"Clouds\",\"description\":\"few clouds\",\"icon\":\"02n\"}],\"base\":\"stations\",\"main\":{\"temp\":299.68,\"feels_like\":293.95,\"temp_min\":299.68,\"temp_max\":299.68,\"pressure\":1010,\"humidity\":12,\"sea_level\":1010,\"grnd_level\":960},\"wind\":{\"speed\":4.43,\"deg\":359},\"clouds\":{\"all\":17},\"dt\":1584907536,\"sys\":{\"country\":\"SD\",\"sunrise\":1584848814,\"sunset\":1584892510},\"timezone\":7200,\"id\":366847,\"name\":\"Singa\",\"cod\":200}",
"date_id": [
"2020-03-22",
1008
]
},
{
"data": "{\"coord\":{\"lon\":34.35,\"lat\":11.77},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",\"main\":{\"temp\":300.18,\"feels_like\":295.04,\"temp_min\":300.18,\"temp_max\":300.18,\"pressure\":1010,\"humidity\":12,\"sea_level\":1010,\"grnd_level\":955},\"wind\":{\"speed\":3.64,\"deg\":357},\"clouds\":{\"all\":1},\"dt\":1584907536,\"sys\":{\"country\":\"SD\",\"sunrise\":1584848719,\"sunset\":1584892404},\"timezone\":7200,\"id\":380174,\"name\":\"Ad-Damazin\",\"cod\":200}",
"date_id": [
"2020-03-22",
2000
]
},
];
