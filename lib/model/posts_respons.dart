import 'package:eclipsdigital/model/posts.dart';

class PostsResponse {
  final List<Posts> postsList;
  final String error;

  PostsResponse(this.postsList, this.error);

  PostsResponse.fromJson(json)
      : postsList = (json as List).map((e) => Posts.fromJson(e)).toList(),
        error = '';

  PostsResponse.withError(String errorValue)
      : postsList = [],
        error = errorValue;
}
