// lib/bloc/product_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/product/product_event.dart';
import 'package:product_listing_app/blocs/product/product_state.dart';

import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/repositories/produc_api_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProducApiService apiService;

  ProductBloc({required this.apiService}) : super(ProductInitial()) {
    on<FetchProductsEvent>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final List<Product> products = await apiService.getProduct();
      
      // Group products by product_type
      final Map<String, List<Product>> groupedProducts = {};
      for (var product in products) {
        if (!groupedProducts.containsKey(product.productType)) {
          groupedProducts[product.productType] = [];
        }
        groupedProducts[product.productType]!.add(product);
      }

      emit(ProductLoaded(groupedProducts: groupedProducts));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
