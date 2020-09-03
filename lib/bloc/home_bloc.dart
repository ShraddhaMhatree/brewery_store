import 'dart:async';
import 'dart:convert';

import 'package:brewery_store/dataSource/brewery_db.dart';
import 'package:brewery_store/models/brewery.dart';
import 'package:brewery_store/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

class HomeBloc {
  final _repo = HomeRepository();
  // final _controller = StreamController<String>.broadcast();
  final _controller = StreamController<List<Brewery>>.broadcast();

  get breweryList => _controller.stream;

  HomeBloc() {
    getList();
  }

  getList() async {
    String val = '';
    List<Brewery> list = List();

    if (kIsWeb) {
      val = WebStorage.instance.getData('data');
      if(val!=null && val.isNotEmpty){
        list = (json.decode(val) as List)
            .map((i) => Brewery.fromJson(i))
            .toList();
      }

    }
    _controller.sink.add(list);
  }

  insertList() async {
    await _repo.getListFromServer();
    getList();
  }

  dispose() {
    _controller.close();
  }
}
