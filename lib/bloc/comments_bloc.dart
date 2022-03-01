import 'package:eclipsdigital/model/comments_response.dart';
import 'package:eclipsdigital/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CommentsBloc {
  final EclipsDigitalRepository _repository = EclipsDigitalRepository();
  final BehaviorSubject<CommentsResponse> _subject =
      BehaviorSubject<CommentsResponse>();

  getComments(int postId) async {
    CommentsResponse response = await _repository.getComments(postId);
    _subject.sink.add(response);
  }

  void drainStream() async {
    await _subject.close();
  }

  BehaviorSubject<CommentsResponse> get subject => _subject;
}

final postBloc = CommentsBloc();
