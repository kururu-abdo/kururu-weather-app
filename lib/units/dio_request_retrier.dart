import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({
    this.dio,
    this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    // TODO: Implement
  }
}