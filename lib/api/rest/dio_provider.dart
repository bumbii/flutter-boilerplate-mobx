import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_mobx/constants/constants.dart';
import 'package:flutter_boilerplate_mobx/router/router.dart';
import 'package:flutter_boilerplate_mobx/utils/local_storage.dart';
import 'package:flutter_boilerplate_mobx/utils/logger.dart';
import 'package:flutter_boilerplate_mobx/utils/network_utils.dart';

Future<Dio> provideDio({Map<String, dynamic>? pHeaders}) async {
  final Map<String, dynamic> headers = pHeaders ??
      {
        // 'content-type': 'multipart/form-data',
      };

  final BaseOptions options = BaseOptions(
    headers: headers,
  );

  final Dio dio = Dio(options);
  final InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(onRequest:
      (RequestOptions options, RequestInterceptorHandler handler) async {
    final bool hasConnection = await hasNetworkConnection();
    if (!hasConnection) {
      go(path: RoutePath.noNetwork);
      return;
    }
    // Try to get access token. If existing, add this token to the http headers
    final String? accessToken = await LocalStorage.instance.getAccessToken();
    if (accessToken?.isNotEmpty == true) {
      options.headers.putIfAbsent(authorization, () => '$bearer $accessToken');
    }
    return handler.next(options);
  }, onResponse: (Response response,
      ResponseInterceptorHandler responseInterceptorHandler) {
    AppLogger.instance.d(response.toString());
    return responseInterceptorHandler.next(response);
  }, onError: (DioException e, ErrorInterceptorHandler handler) async {
    // AppLogger.instance.e(e.message);
    switch (e.runtimeType) {
      case DioException:
        // Here's the sample to get the failed response error code and message
        final res = (e).response;
        AppLogger.instance
            .e('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
        break;
      default:
        break;
    }
    return handler.next(e);
  });
  dio.interceptors.add(interceptorsWrapper);

  return dio;
}
