import 'package:flutter/material.dart';

import '../../domain/model/response/user_response.dart';
class UserView extends StatelessWidget {
  final User user;

  const UserView({
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, bottom: 7, top: 7),
      child: _buildTitleAndDescription(),
    );
  }
  Widget _buildTitleAndDescription() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          user.name ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'Butler',
            fontWeight: FontWeight.w900,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        Text(
          user.username?? '',
        ),
        Text(
          user.email ?? '',
        ),
        Text(
          user.phone ?? '',
        ),
        Text(
          user.address!.city ?? '',
        ),
        Text(
          user.company!.name ?? '',
        ),


      ],
    );
  }


}
