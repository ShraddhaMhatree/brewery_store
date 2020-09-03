import 'dart:html';

class WebStorage {
  WebStorage._internal();

  static final WebStorage instance = WebStorage._internal();

  factory WebStorage() {
    return instance;
  }

  String getData(String key) {
    String value = "";
    value = window.localStorage[key];
    return value;
  }

  void saveData(String key, String value) => window.localStorage[key] = value;

  Future invalidate(String key) async {
    if (window.localStorage.containsKey(key)) {
      window.localStorage.remove(key);
    }
  }
}
