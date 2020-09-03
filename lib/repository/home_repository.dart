
import 'package:brewery_store/dataSource/brewery_db.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HomeRepository{

  Future getListFromServer() async{
    try{
      http.Response response = await http.get("https://api.openbrewerydb.org/breweries");
      if(kIsWeb && response.body!=null && response.body.isNotEmpty){
        WebStorage.instance.saveData('data', response.body);
      }
    }catch(e){
      print(e);
    }
  }
}