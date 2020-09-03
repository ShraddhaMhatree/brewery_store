
import 'dart:async';

import 'package:brewery_store/models/brewery.dart';
import 'package:brewery_store/repository/brewery_repository.dart';
import 'package:brewery_store/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

class HomeBloc{
  final _repo = HomeRepository();
  final _controller = StreamController<String>.broadcast();

  get breweryList => _controller.stream;

  HomeBloc() {
    getList();
  }

  getList() async {
    String val='';
    if(kIsWeb){
      val = WebStorage.instance.getData('data');
      print('bloc $val');
    }
    _controller.sink.add(val);
  }

  insertList() async {
    print('bloc b4 insert');
    await _repo.getListFromServer();
    print('bloc after insert');
    getList();
  }

  dispose() {
    _controller.close();
  }
}