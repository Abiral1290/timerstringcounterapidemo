// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'dart:io' show HttpStatus;
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utilis/resources/data_state.dart';

abstract class BaseApiRepository{

  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>?>? Function() request,
  }) async {
    try {

      final httpResponse = await request();
      log(' my listsss${httpResponse!.data.toString()}');
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data!);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioError catch (error) {
      return DataFailed(error);
    }
  }
}
