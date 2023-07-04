import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:timerstringcounter/domain/model/response/user_response.dart';
import 'package:timerstringcounter/utilis/constants/strings.dart';


part 'user_api_services.g.dart';


@RestApi(baseUrl: baseUrl,parser: Parser.MapSerializable)
abstract class UserApiService{
  factory UserApiService(Dio dio,{String baseUrl})= _UserApiService;

  @GET('users')
  Future<HttpResponse<List<User>>> getUserList();
}