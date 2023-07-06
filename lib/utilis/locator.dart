// import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:timerstringcounter/datasources/remote/user_api_services.dart';
// import 'package:timerstringcounter/datasources/repositories/api_repository_impl.dart';
// import 'package:timerstringcounter/domain/repositories/api_repository.dart';
//
//
//
//
// final locator = GetIt.instance;
//
// Future<void> initializeDependencies() async {
//
//
//   final dio = Dio();
//   dio.interceptors.add(AwesomeDioInterceptor());
//
//   locator.registerSingleton<Dio>(dio);
//
//   locator.registerSingleton<UserApiService>(
//     UserApiService(locator<Dio>()),
//   );
//
//   locator.registerSingleton<ApiRepository>(
//     ApiRepositoryImpl(locator<UserApiService>()),
//   );
//
//
// }

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:timerstringcounter/datasources/remote/user_api_services.dart';

import '../datasources/repositories/api_repository_impl.dart';
import '../domain/repositories/api_repository.dart';


final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<UserApiService>(
    UserApiService(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<UserApiService>()),
  );




}
