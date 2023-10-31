import 'package:dio/dio.dart';

import '../../utils/util.dart';
import '../models/response/response.dart';
import '../networks/base_model.dart';
import '../networks/clients/clients.dart';
import 'repository.dart';

class GeneralRepository extends BaseRepository {
  final GeneralClient generalClient;

  GeneralRepository({required this.generalClient});

  Future<BaseModel<AboutAppModel>> aboutFarco() async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await generalClient.aboutFarco().then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }

  Future<BaseModel<AboutAppModel>> aboutApp() async {
    if (await checkForConnectivity()) {
      try {
        return BaseModel(
            data: await generalClient.aboutApp().then((value) {
          return value.data;
        }));
      } on DioException catch (e) {
        return BaseModel(error: ErrorResponse(dioException: e));
      }
    } else {
      Util.kToastNOInternet();

      return BaseModel.noNetworkConnection();
    }
  }
}
