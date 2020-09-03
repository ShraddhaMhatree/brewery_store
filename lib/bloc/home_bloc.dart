import 'dart:async';

import 'package:brewery_store/dataSource/brewery_db.dart';
import 'package:brewery_store/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

class HomeBloc {
  final _repo = HomeRepository();
  final _controller = StreamController<String>.broadcast();

  get breweryList => _controller.stream;

  HomeBloc() {
    getList();
  }

  getList() async {
    String val = '';
    if (kIsWeb) {
      val = WebStorage.instance.getData('data');
    }
    _controller.sink.add(val);
  }

  insertList() async {
    await _repo.getListFromServer();
    getList();
  }

  dispose() {
    _controller.close();
  }
}
