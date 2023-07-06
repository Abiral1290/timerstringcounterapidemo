import 'package:timerstringcounter/datasources/remote/user_api_services.dart';
import 'package:timerstringcounter/datasources/repositories/base/base_api_repository.dart';
import 'package:timerstringcounter/domain/repositories/api_repository.dart';

import '../../domain/model/request/user_request.dart';
import '../../domain/model/response/user_response.dart';
import '../../utilis/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository{
  final UserApiService _userApiService;

  ApiRepositoryImpl(this._userApiService);

  @override
  Future<DataState<List<User>>> getUserList({
  required UserRequest request
}){
    return getStateOf<List<User>>(
        request: () => _userApiService.getUserList());
  }
}