import 'package:dio/dio.dart';
import 'package:pazar_app/networking/model/RequestVerificationBody.dart';
import 'package:pazar_app/networking/model/RequestVerificationResponse.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "http://dolato.boraq-group.net/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/request-verification-code")
  Future<RequestVerificationResponse> getVerificationCode(
      @Body() RequestVerificationBody requestVerificationBody);
}
