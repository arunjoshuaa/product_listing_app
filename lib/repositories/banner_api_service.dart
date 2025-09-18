import 'package:dio/dio.dart';
import 'package:product_listing_app/models/banner_model.dart';
import 'package:product_listing_app/utils/constants.dart';

class BannerApiService {
  final baseUrl=AppConstants.baseUrl;
  final dio= Dio();
  Future<List<BannerModel>> fetchBanner()async{
    try{
      final response=await dio.get("$baseUrl/banners");
if(response.statusCode==200){
  print("BANNER FETCHED SUCCESSFULLY:${response.data}");
  final List<dynamic>bannerjson=response.data;
return bannerjson.map((json)=>BannerModel.fromJson(json)).toList();

}
      throw Exception("Failed to fetch the banner,invlid statuse code:${response.statusCode}:${response.statusMessage}");
    }on DioException catch(e){
      print("BANNER FETCHING FAILED:${e.message}");
      throw Exception(e.message);
    }
  }

}