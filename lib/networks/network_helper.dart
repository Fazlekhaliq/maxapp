import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class NetworkHelper{
  
 final String url;
 NetworkHelper({required this.url});
 Future<dynamic> getData()async{
   try{
     http.Response response= await http.get(Uri.parse(url));
     if (response.statusCode==200){
       var data= jsonDecode(response.body);
       return data;


   }else{
    throw Exception("api fld");
     }

   }catch(e){
    throw Exception(e);

   }
   

 }
}
