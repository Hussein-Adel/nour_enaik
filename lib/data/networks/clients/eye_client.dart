import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/response/response.dart';
import '../network_constant.dart';

part 'eye_client.g.dart';

@RestApi()
abstract class EyeClient {
  factory EyeClient(Dio dio, {String baseUrl}) = _EyeClient;

  @GET(NetworkConstant.kEyePressure)
  Future<BaseResponseList<EyePressureModel>> getEyePressure();
  @POST('${NetworkConstant.kEyePressure}/${NetworkConstant.kStore}')
  Future<BaseResponseList<EyePressureModel>> storeEyePressure(
      @Body() var model);

  @GET(NetworkConstant.kEyeSight)
  Future<BaseResponseList<EyeSightModel>> getEyeSight();
  @POST('${NetworkConstant.kEyeSight}/${NetworkConstant.kStore}')
  Future<BaseResponseList<EyeSightModel>> storeEyeSight(@Body() var model);
}
