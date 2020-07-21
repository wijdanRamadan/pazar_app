// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facebook_profile_info_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FacebookClient implements FacebookClient {
  _FacebookClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://graph.facebook.com/v3.3';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getProfile(access_token) async {
    ArgumentError.checkNotNull(access_token, 'access_token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'access_token': access_token?.toJson()
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/me?',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Profile.fromJson(_result.data);
    return value;
  }
}
