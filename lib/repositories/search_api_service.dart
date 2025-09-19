import 'package:dio/dio.dart';
import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/utils/constants.dart';

class SearchApiService {
  final dio=Dio();
  final baseUrl=AppConstants.baseUrl;
  Future searchQuery(String query)async{
    try {
      final response=await dio.get('$baseUrl/search/?query=$query');
      if(response.statusCode==200){
          final List<dynamic> productsJson = response.data;
        return productsJson.map((json) => Product.fromJson(json)).toList();
     
      }
    }on DioException catch  (e) {
      throw Exception(e.message);
    }
  }
}