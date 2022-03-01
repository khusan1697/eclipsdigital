import 'package:eclipsdigital/bloc/posts_bloc.dart';
import 'package:eclipsdigital/model/posts.dart';
import 'package:eclipsdigital/screens/comment_screen.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:eclipsdigital/widget/post_item_loading_widget.dart';
import 'package:eclipsdigital/widget/post_item_widget.dart';
import 'package:flutter/material.dart';
import '../model/posts_respons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PostsBloc _postsBloc = PostsBloc();

  @override
  void initState() {
    _postsBloc.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Eclips Digital",
          style: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
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
            return _buildPostListWidget(snapshot.data!);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          } else {
            return _buildLoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 19,
            child: ListView(
              children: List.generate(
                4,
                (index) {
                  return const PostItemLoadingWidget();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Error eccured $error",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostListWidget(PostsResponse response) {
    List<Posts> posts = response.postsList;
    if (posts.length == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "There is no posts",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(15)),
              ),
            ],
          ),
        ],
      );
    } else {
      return ListView(
        children: List.generate(
          posts.length,
          (index) {
            return PostItemWidget(
              posts: posts[index],
              commentPress: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CommentScreen(
                    postId: posts[index].id,
                  ),
                ),
              ),
              telegramPress: () {},
              sharePress: () {},
            );
          },
        ),
      );
    }
  }
}
