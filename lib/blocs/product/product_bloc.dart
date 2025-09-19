import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/product/product_event.dart';
import 'package:product_listing_app/blocs/product/product_state.dart';
import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/repositories/produc_api_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProducApiService apiService;
  List<Product> _allProducts = []; // 🔴 Keep a copy of all products

  ProductBloc({required this.apiService}) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FilterProductsEvent>(_onFilterProducts); // 🔥 Listen to filter events
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final List<Product> products = await apiService.getProduct();
      _allProducts = products;

      final groupedProducts = _groupProducts(products);
      emit(ProductLoaded(groupedProducts: groupedProducts));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  void _onFilterProducts(
      FilterProductsEvent event, Emitter<ProductState> emit) {
    final query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      // 🔁 Reset to original
      final groupedProducts = _groupProducts(_allProducts);
      emit(ProductLoaded(groupedProducts: groupedProducts));
    } else {
      // 🔍 Filter by name (case insensitive)
      final filtered = _allProducts.where((product) {
        return product.name.toLowerCase().contains(query);
      }).toList();

      final groupedProducts = _groupProducts(filtered);
      emit(ProductLoaded(groupedProducts: groupedProducts));
    }
  }

  /// 🔗 Group products by productType
  Map<String, List<Product>> _groupProducts(List<Product> products) {
    final Map<String, List<Product>> grouped = {};
    for (var product in products) {
      final key = product.productType;
      grouped.putIfAbsent(key, () => []).add(product);
    }
    return grouped;
  }
}
