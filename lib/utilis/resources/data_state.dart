import 'package:dio/dio.dart';

abstract class DataState<T>{
  final T? data;
  final DioException? error;

  const DataState({this.data,this.error});

}

class DataSucess<T> extends DataState{
  const DataSucess(T data): super(data: data);
}

class DataFailed<T> extends DataState{
  const DataFailed(DioException exception): super(error: exception);
}
class DataNotSet<T> extends DataState<T> {
  const DataNotSet();
}
