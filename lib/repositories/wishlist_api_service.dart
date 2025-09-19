import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:product_listing_app/core/storage_service.dart';
import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/utils/constants.dart';

class WishlistApiService {
  final baseUrl = AppConstants.baseUrl;

  final dio = Dio();
  Future<List<Product>> getWishlistProduct() async {
    final token = await SecureStorageService().getToken();
    try {
      final response = await dio.get(
        "${baseUrl}/wishlist/",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("WISHLIST FETCHED SUCCESS: ${response.data}");
        // Corrected line: Map the list of JSON objects to a list of Product objects.
        final List<dynamic> productsJson = response.data;
        return productsJson.map((json) => Product.fromJson(json)).toList();
      }

      throw Exception("Failed to fetch wishlist");
    } on DioException catch (e) {
      print("WISHLIST FETCHING FAILED:${e.message}");
      throw Exception("WISHLIST fetching failed:${e.message}");
    }
  }

  Future addRemoveWhishlist(String productId) async {
    final token = await SecureStorageService().getToken();
    try {
      print("id of the product for ad or remove is $productId");
      final response = await dio.post(
        "${baseUrl}/add-remove-wishlist/",
        data: {'product_id': productId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print("PRODUCT ADDED/REMOVED SUCCESSFULLY: ${response.data}");
        // Corrected line: Map the list of JSON objects to a list of Product objects.
        final responseMessage = response.data['message'];
        return responseMessage;
      }

      throw Exception("Failed to add/remove wishlist");
    } on DioException catch (e) {
      print("WISHLIST ADD/REMOVE FAILED:${e.message}");
      throw Exception("Wishlist add/remove failed:${e.message}");
    }
  }
}
