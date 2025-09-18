import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/utils/constants.dart';


class ProducApiService {
final baseUrl=AppConstants.baseUrl;

final dio=Dio();
Future <List<Product>>getProduct()async{
  try{
  final response=await dio.get("${baseUrl}/products/");

if(response.statusCode==200){
  print("PRODUCT FETCHED SUCCESS: ${response.data}");
   // Corrected line: Map the list of JSON objects to a list of Product objects.
        final List<dynamic> productsJson = response.data;
        return productsJson.map((json) => Product.fromJson(json)).toList();

}

throw Exception("Failed to fetch produce");
}on DioException catch(e){
  print("PRODUCT FETCHING FAILED:${e.message}");
  throw Exception("Product fetching failed:${e.message}");
}
}
}
