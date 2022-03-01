import 'package:eclipsdigital/model/albums_response.dart';
import 'package:eclipsdigital/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class AlbumsBloc {
  final EclipsDigitalRepository _repository = EclipsDigitalRepository();
  final BehaviorSubject<AlbumsResponse> _subject =
      BehaviorSubject<AlbumsResponse>();

  getAlbums(int userId) async {
    AlbumsResponse response = await _repository.getAlbums(userId);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.close();
  }

  BehaviorSubject<AlbumsResponse> get subject => _subject;
}

final albumBloc = AlbumsBloc();
