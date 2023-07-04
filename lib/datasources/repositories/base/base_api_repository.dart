import 'dart:async';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/dio.dart';

import '../../../utilis/resources/data_state.dart';

abstract class BaseApiRepository{

  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>?>? Function()  request,
  }) async{
    try{
      final httpResponse = await request();
      if(httpResponse.response.statusCode == HttpStatus.ok){
        return DataSucess(httpResponse.data);
      }else{
        throw DioException.connectionError(
            requestOptions: httpResponse.response.requestOptions,
            reason: httpResponse.response);
      }
  }on DioException catch (error){
      return DataFailed(error);
    }
}
}