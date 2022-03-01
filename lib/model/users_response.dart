import 'package:eclipsdigital/model/users.dart';

class UsersResponse {
  final List<Users> userList;
  final String error;

  UsersResponse(this.userList, this.error);

  UsersResponse.fromJson(json)
      : userList = (json as List).map((e) => Users.fromJson(e)).toList(),
        error = "";

  UsersResponse.withError(String errorValue)
      : userList = [],
        error = errorValue;
}
