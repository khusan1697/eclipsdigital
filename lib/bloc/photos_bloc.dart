import 'package:eclipsdigital/model/photos_response.dart';
import 'package:eclipsdigital/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PhotosBloc {
  final EclipsDigitalRepository _repository = EclipsDigitalRepository();
  final BehaviorSubject<PhotosResponse> _subject =
      BehaviorSubject<PhotosResponse>();

  getPhotos(int albumId) async {
    PhotosResponse response = await _repository.getPhotos(albumId);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.close();
  }

  BehaviorSubject<PhotosResponse> get subject => _subject;
}

final photos = PhotosBloc();
