import 'package:eclipsdigital/model/posts_respons.dart';
import 'package:eclipsdigital/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PostsBloc {
  final EclipsDigitalRepository _repository = EclipsDigitalRepository();
  final BehaviorSubject<PostsResponse> _subject =
      BehaviorSubject<PostsResponse>();

  getPosts() async {
    PostsResponse postsResponse = await _repository.getPosts();
    _subject.sink.add(postsResponse);
  }

  getUserPost(int userId) async {
    PostsResponse response = await _repository.getUserPost(userId);
    _subject.sink.add(response);
  }

  void drainStream() async {
    await _subject.drain();
  }

  BehaviorSubject<PostsResponse> get subject => _subject;
}

final postBloc = PostsBloc();
