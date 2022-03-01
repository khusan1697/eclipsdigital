import 'package:eclipsdigital/bloc/comments_bloc.dart';
import 'package:eclipsdigital/repository/repository.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:eclipsdigital/widget/comment_item_loading_widget.dart';
import 'package:eclipsdigital/widget/comment_item_widget.dart';
import 'package:flutter/material.dart';
import '../model/comments.dart';
import '../model/comments_response.dart';

class CommentScreen extends StatefulWidget {
  final int postId;

  const CommentScreen({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  String text = "";
  final CommentsBloc _commentsBloc = CommentsBloc();
  final EclipsDigitalRepository _repository = EclipsDigitalRepository();
  TextEditingController comment = TextEditingController();

  @override
  void initState() {
    _commentsBloc.getComments(widget.postId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Comment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<CommentsResponse>(
        stream: _commentsBloc.subject,
        builder:
            (BuildContext context, AsyncSnapshot<CommentsResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != null &&
                snapshot.data!.error.length > 0) {
              return _buildErrorComment(snapshot.data!.error);
            }
            return _buildCommentWidget(snapshot.data!);
          } else if (snapshot.hasError) {
            return _buildErrorComment(snapshot.data!.error);
          } else {
            return _buildLoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return ListView(
      children: List.generate(
        6,
        (index) {
          return const CommentItemLoadingWidget();
        },
      ),
    );
  }

  Widget _buildErrorComment(String error) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCommentWidget(CommentsResponse response) {
    List<Comments> comments = response.commentsList;
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: ListView(
            children: List.generate(
              comments.length,
              (index) {
                return CommentItemWidget(
                  comments: comments[index],
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
                vertical: getProportionateScreenHeight(5),
              ),
              decoration: BoxDecoration(
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -1),
                    color: const Color(0xff979797).withOpacity(0.2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.7,
                    height: getProportionateScreenHeight(40),
                    child: TextField(
                      controller: comment,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      onChanged: (value) => print(value),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                          vertical: getProportionateScreenHeight(10),
                        ),
                        hintText: "Message",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _repository.postComment(
                        widget.postId,
                        comment.toString(),
                      );
                      comment.clear();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Successful commented"),
                        backgroundColor: Color(0xff979797),
                      ));
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
