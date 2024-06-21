import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phone_store_api/PhoneModel.dart';

class ApiService{

  //Api url
  final url = 'https://api.restful-api.dev/objects';

  late List<PhoneModel> devices = [];


  Future<void> getData() async{

    final response = await http.get(Uri.parse(url));

    try{
      if(response.statusCode == 200){
        print('API connect');

        // Map deviceData = jsonDecode(response.body);
        List<dynamic> device = jsonDecode(response.body);

        devices = device.map((json) => PhoneModel.fromJson(json)).toList();

      }else{
        Future.error('Something error, ${response.statusCode}');
        print('API not connect, Something error');
      }
    }catch(e){
      Future.error('Something error, $e');
    }

  }
}