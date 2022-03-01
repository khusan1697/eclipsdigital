import 'package:eclipsdigital/model/comments.dart';

class CommentsResponse {
  final List<Comments> commentsList;
  final String error;

  CommentsResponse(
    this.commentsList,
    this.error,
  );

  CommentsResponse.fromJson(json)
      : commentsList = (json as List).map((e) => Comments.fromJson(e)).toList(),
        error = "";

  CommentsResponse.withError(String errorValue)
      : commentsList = [],
        error = errorValue;
}
