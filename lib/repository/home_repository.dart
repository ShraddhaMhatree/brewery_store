
import 'package:brewery_store/dataSource/brewery_db.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HomeRepository{

  Future getListFromServer() async{
    print('bloc api before');
    try{
      http.Response response = await http.get("https://api.openbrewerydb.org/breweries");
      print('bloc api val ${response.body}');
      if(kIsWeb){
        WebStorage.instance.saveData('data', response.body);
      }
      print('bloc api after');
    }catch(e){
      print('bloc api fail');
      print(e);
    }
  }
}