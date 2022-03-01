import 'dart:async';

import 'package:flutter/material.dart';

enum NavBarItem { home, users, albums, profile }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _streamController =
      StreamController<NavBarItem>.broadcast();
  NavBarItem navBarItem = NavBarItem.home;
  Stream<NavBarItem> get streamNavBar => _streamController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _streamController.sink.add(NavBarItem.home);
        break;
      case 1:
        _streamController.sink.add(NavBarItem.users);
        break;
      case 2:
        _streamController.sink.add(NavBarItem.albums);
        break;
      case 3:
        _streamController.sink.add(NavBarItem.profile);
    }
  }

  close() {
    _streamController.close();
  }
}
