// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://dolato.boraq-group.net/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getVerificationCode(requestVerificationBody) async {
    ArgumentError.checkNotNull(
        requestVerificationBody, 'requestVerificationBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestVerificationBody?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/request-verification-code',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RequestVerificationResponse.fromJson(_result.data);
    return value;
  }
}
