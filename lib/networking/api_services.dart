import 'package:dio/dio.dart';
import 'package:pazar_app/networking/model/FacebookAuthRequest.dart';
import 'package:pazar_app/networking/model/FacebookAuthResponse.dart';
import 'package:pazar_app/networking/model/RequestVerificationBody.dart';
import 'package:pazar_app/networking/model/RequestVerificationResponse.dart';
import 'package:pazar_app/networking/model/category.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "http://dolato.boraq-group.net/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/request-verification-code")
  Future<RequestVerificationResponse> getVerificationCode(
      @Body() RequestVerificationBody requestVerificationBody);

  @POST("/auth-facebook")
  Future<FacebookAuthResponse> facebookAuth(
      @Body() FacebookAuthRequest facebookAuthRequest);

  @GET("/categories")
  Future<List<Category>> getCategories();
}
