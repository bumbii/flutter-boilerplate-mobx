import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.yourdomain.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
}
