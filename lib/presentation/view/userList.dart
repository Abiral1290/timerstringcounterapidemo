import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timerstringcounter/presentation/cubits/base/user/user_cubit.dart';
import 'package:timerstringcounter/presentation/view/user_view.dart';

import '../../domain/model/response/user_response.dart';
import '../cubits/base/user/user_state.dart';
class UserList extends HookWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final scrollController = useScrollController();


    Widget _buildCountryList(
       List<User> user,
      bool noMoreData
      ){
          return

            CustomScrollView(

            shrinkWrap: true,
             controller: scrollController,
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: user.length,
                          (context,index) => UserView(user: user[index]
                        )
                  )
              )
            ],
          );

  }



    return BlocBuilder<UserCubit,UserState>(
        builder:(_,state){
          switch(state.runtimeType){
            case UserLoading:
              return const Center(child: CircularProgressIndicator(),);
            case UserFailed:
              return const Center(child: Text('No Data'),);
            case UserSuccess:
              return _buildCountryList(state.user, state.noMoreData);
            default:
              return const SizedBox();
          }
        }
    );

  }
}
