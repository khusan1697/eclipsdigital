import 'package:eclipsdigital/bloc/posts_bloc.dart';
import 'package:eclipsdigital/model/posts.dart';
import 'package:eclipsdigital/widget/user_post_item_loading_widget.dart';
import 'package:eclipsdigital/widget/user_post_item_widget.dart';
import 'package:flutter/material.dart';
import '../model/posts_respons.dart';

class UserPostScreen extends StatefulWidget {
  final int userId;

  const UserPostScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  final PostsBloc _postsBloc = PostsBloc();

  @override
  void initState() {
    _postsBloc.getUserPost(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<PostsResponse>(
        stream: _postsBloc.subject,
        builder: (BuildContext context, AsyncSnapshot<PostsResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != null &&
                snapshot.data!.error.length > 0) {
              return _buildErrorWidget(snapshot.data!.error);
            }
            return _buildUserPosts(snapshot.data!);
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
              6,
              (index) {
                return const UserPostItemLoadingWidget();
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 4,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildErrorWidget(String error) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" Error ecured $error", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildUserPosts(PostsResponse response) {
    List<Posts> postsList = response.postsList;
    if (postsList.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "There is no posts",
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    } else {
      return ListView(
        children: List.generate(
          postsList.length,
          (index) {
            return UserPostItemWidget(
              posts: postsList[index],
            );
          },
        ),
      );
    }
  }
}
