import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_mobx/api/rest/rest_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dio_provider.dart';

class RestClientProvider {
  static RestClient? restClient;

  static final String _baseUrl = dotenv.env['BASE_URL']!;

  /// Initialize rest client.
  /// [dio] The dio that will be used as a http client
  /// [forceInit] If true, we recreate RestClient. This is necessary when user
  /// logs in successfully or the token is reset/refreshed. In that case, we need to set
  /// the token to header again.
  static Future<void> init({Dio? dio, bool forceInit = false}) async {
    Dio? providedDio = dio;
    // If dio is not passed, generate new one
    providedDio ??= await provideDio();

    if (forceInit) {
      restClient = RestClient(providedDio, baseUrl: _baseUrl);
    } else {
      // Only recreate when restClient is null.
      restClient ??= RestClient(providedDio, baseUrl: _baseUrl);
    }
  }
}
