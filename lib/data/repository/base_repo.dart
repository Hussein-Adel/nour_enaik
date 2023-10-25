import 'package:connectivity_plus/connectivity_plus.dart';
import '../networks/base_model.dart';
import 'package:dio/dio.dart';

class BaseRepository {
  Future<bool> checkForConnectivity() async {
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  Future<bool> checkAuth(DioException dioException) async {
    final error = ErrorResponse(dioException: dioException);
    if (error.statusCode == 401) {
      do {} while (true);
    }
    return true;
  }
}
