import 'package:eclipsdigital/bloc/users_bloc.dart';
import 'package:eclipsdigital/screens/user_detail_screen.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:eclipsdigital/widget/user_item_loading_widget.dart';
import 'package:eclipsdigital/widget/user_item_widget.dart';
import 'package:flutter/material.dart';
import '../model/users.dart';
import '../model/users_response.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final UsersBloc _usersBloc = UsersBloc();

  @override
  void initState() {
    _usersBloc.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Users",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<UsersResponse>(
        stream: _usersBloc.subject,
        builder: (BuildContext context, AsyncSnapshot<UsersResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != null &&
                snapshot.data!.error.length > 0) {
              return _buildErrorWidget(snapshot.data!.error);
            }
            return _buildUsersWidget(snapshot.data!);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.data!.error);
          } else {
            return _buildLoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Column(
      children: [
        Expanded(
            flex: 10,
            child: ListView(
              children: List.generate(
                4,
                (index) {
                  return const UserItemLoadingWidget();
                },
              ),
            )),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 4.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(String error) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Error ecured $error",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsersWidget(UsersResponse usersResponse) {
    List<Users> userList = usersResponse.userList;
    if (userList.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "There is no users",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(20)),
            )
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(5),
              ),
              child: TextField(
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  hintText: "Search...",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView(
              children: List.generate(
                userList.length,
                (index) {
                  return UserItemWidget(
                    users: userList[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailScreen(
                          user: userList[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }
  }
}
