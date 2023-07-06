import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/model/response/user_response.dart';

class UserState extends Equatable{

  final List<User> user;
  final bool noMoreData;
  final DioError? exception;

  UserState({
    this.user = const [],
    this.noMoreData = true,
    this.exception
  });

  @override

  List<Object?> get props => [user,noMoreData,exception];
}

class UserSuccess extends UserState{
  UserSuccess({super.user,super.noMoreData});
}

class UserLoading extends UserState{
  UserLoading();
}

class UserFailed extends UserState{
  UserFailed({super.exception});
}