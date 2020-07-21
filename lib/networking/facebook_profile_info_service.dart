import 'package:dio/dio.dart';
import 'package:pazar_app/networking/model/FacebookAccessTokenModel.dart';
import 'package:pazar_app/networking/model/Profile.dart';
import 'package:retrofit/retrofit.dart';

part 'facebook_profile_info_service.g.dart';

@RestApi(baseUrl: "https://graph.facebook.com/v3.3")
abstract class FacebookClient {
  factory FacebookClient(Dio dio, {String baseUrl}) = _FacebookClient;

  @GET("/me?")
  Future<Profile> getProfile(
      @Query("access_token") FacebookAccessTokenModel access_token);
}
