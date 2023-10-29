import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/response/response.dart';
import '../network_constant.dart';

part 'eye_client.g.dart';

@RestApi()
abstract class EyeClient {
  factory EyeClient(Dio dio, {String baseUrl}) = _EyeClient;

  @POST(NetworkConstant.kEyePressure)
  Future<BaseResponseList<EyePressureModel>> getEyePressure();
  @POST('${NetworkConstant.kEyePressure}/${NetworkConstant.kStore}')
  Future<BaseResponseList<EyePressureModel>> storeEyePressure(
      @Body() var model);

  @POST(NetworkConstant.kEyeSight)
  Future<BaseResponseList<EyeSightModel>> getEyeSight();
  @POST('${NetworkConstant.kEyeSight}/${NetworkConstant.kStore}')
  Future<BaseResponseList<EyeSightModel>> storeEyeSight(@Body() var model);
}
