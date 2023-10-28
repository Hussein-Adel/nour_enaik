import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/response/response.dart';
import '../network_constant.dart';

part 'general_client.g.dart';

@RestApi()
abstract class GeneralClient {
  factory GeneralClient(Dio dio, {String baseUrl}) = _GeneralClient;

  @GET(NetworkConstant.kAboutFarco)
  Future<BaseResponse<AboutAppModel>> aboutFarco();
  @GET(NetworkConstant.kAboutApp)
  Future<BaseResponse<AboutAppModel>> aboutApp();
}
