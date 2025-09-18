import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:product_listing_app/utils/constants.dart';


class AuthApiService {
final baseUrl=AppConstants.baseUrl;

final dio=Dio();
Future loginRegister(String phoneno, String firstname)async{
try{
  final response=await dio.post("${baseUrl}/login",data: {
    "phone_number":phoneno,
    "first_name":firstname
  });

if(response.statusCode==200){
  print("LOGIN SUCCESS: ${response.data}");
  return jsonDecode(response.data) ;

}

throw Exception("Failed to login/register");
}catch(e){
  print("LOGIN/REGISTER FAILED:${e}");
  throw Exception("Login/Register failed:${e}");
}
}
}