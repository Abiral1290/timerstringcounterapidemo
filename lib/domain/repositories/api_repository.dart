import 'package:timerstringcounter/domain/model/request/user_request.dart';

import '../../utilis/resources/data_state.dart';
import '../model/response/user_response.dart';

abstract class ApiRepository{

  Future<DataState<List<User>>> getUserList({
  required UserRequest request
});
}