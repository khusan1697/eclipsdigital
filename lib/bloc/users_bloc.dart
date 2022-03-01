import 'package:eclipsdigital/model/users_response.dart';
import 'package:eclipsdigital/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class UsersBloc {
  final EclipsDigitalRepository _repository = EclipsDigitalRepository();
  final BehaviorSubject<UsersResponse> _subject =
      BehaviorSubject<UsersResponse>();

  getUsers() async {
    UsersResponse usersResponse = await _repository.getUsers();
    _subject.sink.add(usersResponse);
  }

  void drainStream() {
    _subject.close();
  }

  BehaviorSubject<UsersResponse> get subject => _subject;
}

final userBloc = UsersBloc();
