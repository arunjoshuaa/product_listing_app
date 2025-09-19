import 'package:dio/dio.dart';
import 'package:product_listing_app/core/storage_service.dart';
import 'package:product_listing_app/models/user_model.dart';
import 'package:product_listing_app/utils/constants.dart';

class ProfieApiService {
  final baseUrl=AppConstants.baseUrl;
  final dio=Dio();
  Future getProfile()async{
      final token=await SecureStorageService().getToken();

    try{
      print("token in accesstoken is${token}");
      final response=await dio.get("$baseUrl/user-data/",options: Options(headers:{
        'Authorization': 'Bearer $token',
      }));
      if(response.statusCode==200){
        print("USER FETCHED SUCCESSFULLY${response.data}");
        final userJson=response.data;
        return UserModel.fromJson(userJson);
      }
              throw Exception('User Fetching Failed');

    }on DioException catch(e){
      print("USER FETCHING FAILED:${e}");
      throw Exception(e.message);
    }
  }

  
}