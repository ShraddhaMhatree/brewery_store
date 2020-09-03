import 'dart:html';

class WebStorage {

  //Singleton
  WebStorage._internal();
  static final WebStorage instance = WebStorage._internal();
  factory WebStorage() {
    return instance;
  }

  String getData(String key){
    String value = "";
    value = window.localStorage[key];
    return value;
  }

  // void saveData(String value) =>
  //     window.localStorage['data'] = value;

  void saveData(String key,String value) =>
      window.localStorage[key] = value;

  Future invalidate() async {
    window.localStorage.remove('data');
  }

  // String get data => window.localStorage['data'];
  // set data(String value) => (value == null) ? window.localStorage.remove('data') : window.localStorage['data'] = value;
}