import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:timerstringcounter/domain/model/request/user_request.dart';
import 'package:timerstringcounter/presentation/cubits/base/user/user_state.dart';

import '../../../../domain/model/response/user_response.dart';
import '../../../../domain/repositories/api_repository.dart';
import '../../../../utilis/resources/data_state.dart';
import '../base_cubit.dart';


class UserCubit extends BaseCubit<UserState, List<User>>{

  final ApiRepository _apiRepository;

  UserCubit(this._apiRepository ): super(  UserLoading(),[]);


  Future<void> getCountryList()async{
    if(isBusy) return;

    await run(() async{
      final response = await _apiRepository.getUserList(request: UserRequest());

      if(response is DataSuccess){
        final user = response.data;
        //   final noMoreData = countrys.length < defaultPageSize;
        log('my cubit list length${user!.length}');
        data.addAll(user);
        log('my cubit list after${user}');

        // _page++;

        emit(UserSuccess(user: data,noMoreData: true));
      }else if(response is DataFailed){
        emit(UserFailed(exception: DioError(requestOptions: RequestOptions(path: response.toString()))));
      }
    });
  }




}