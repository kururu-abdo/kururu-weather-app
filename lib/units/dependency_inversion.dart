import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:weather/data/local_Data_sources.dart';
import 'package:weather/data/remote_data_sources.dart';
import 'package:weather/repository/weather_repository.dart';
import 'package:weather/units/network_info.dart';

final sl = GetIt.instance;
Future<void> init() async {
//Bloc
  //sl.registerFactory(() => LocationBloc());

  ///modell

  ///  repositorieds [kururu secrets]
  sl.registerLazySingleton<Weather_repository>(
      () => Weather_Repository_Impl(sl() ,sl() ,sl()));


  ///
// data sources

  sl.registerLazySingleton<RemoteContract>(
      () => Remote(http: sl() ,loc: sl() ));

  sl.registerLazySingleton<LocalContract>(() => Local());
  //sl.registerLazySingleton(() => Local);
// core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

// exterinal

  sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerLazySingleton<Client >(() => Client());
  sl.registerLazySingleton(()=>dio.Dio());
}
