import 'package:brewery_store/models/brewery.dart';
import 'package:brewery_store/repository/brewery_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomeRepository{

  Future getListFromServer() async{
    print('bloc api before');
    List<Brewery> myModels = [];
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
    // print(response.body);

    // myModels=(json.decode(response.body) as List).map((i) =>
    //     Brewery.fromJson(i)).toList();

  }
}