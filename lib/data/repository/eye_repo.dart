import 'package:dio/dio.dart';

import '../models/response/response.dart';
import '../networks/base_model.dart';
import '../networks/clients/clients.dart';
import 'repository.dart';

class EyeRepository extends BaseRepository {
  final EyeClient eyeClient;

  EyeRepository({required this.eyeClient});

  Future<BaseModel<List<EyePressureModel>>> getEyePressure() async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await eyeClient.getEyePressure().then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      //Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }

  Future<BaseModel<List<EyePressureModel>>> storeEyePressure(var model) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await eyeClient.storeEyePressure(model).then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      //Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }

  Future<BaseModel<List<EyeSightModel>>> getEyeSight() async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await eyeClient.getEyeSight().then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      //Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }

  Future<BaseModel<List<EyeSightModel>>> storeEyeSight(var data) async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await eyeClient.storeEyeSight(data).then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      //Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }
}
