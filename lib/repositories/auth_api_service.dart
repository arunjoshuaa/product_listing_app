import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:product_listing_app/utils/constants.dart';


class AuthApiService {
final baseUrl=AppConstants.baseUrl;

final dio=Dio();
Future verify(String phoneNumber)async{
  try {
    print("The phonenumner in api is${phoneNumber}");
    final response= await dio.post("$baseUrl/verify/",data: {
      "phone_number":phoneNumber
    },
    );
    if(response.statusCode==200){
      print("VERIFICATION SUCCESS:${response.data}");
    return {
"otp":response.data['otp'],
"user":response.data['user']

    };
    }
    throw Exception("Verificaton failed with status code of${response.statusCode}-${response.statusMessage}");
  }on DioException catch (e) {
    print("VERIFICATION FAILED:${e}");
    throw Exception("Verification failed:$e");
  }
}
Future loginRegister(String phoneno, String firstname)async{
try{
  print("login register phonenumber and name is${phoneno}, ${firstname} ");
  final response=await dio.post("${baseUrl}/login-register/",data: {
    "phone_number":phoneno,
    "first_name":firstname
  });

if(response.statusCode==200){
  print("LOGIN SUCCESS: ${response.data}");
  return response.data;

}

throw Exception("Failed to login/register");
}catch(e){
  print("LOGIN/REGISTER FAILED:${e}");
  throw Exception("Login/Register failed:${e}");
}
}
}