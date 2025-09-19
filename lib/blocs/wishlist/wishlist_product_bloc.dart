// lib/bloc/product_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_event.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_state.dart';

import 'package:product_listing_app/models/product_model.dart';

import 'package:product_listing_app/repositories/wishlist_api_service.dart';

class WishlistProductBloc extends Bloc<WishlistProductEvent, WishlistProductState> {
  final WishlistApiService wishlistApiService;

  WishlistProductBloc({required this.wishlistApiService}) : super(WishlistProductInitial()) {
    on<FetchWishlistProducts>(_onFetchWishlistProducts);
    on<AddorRemoveWishlistItemEvent>(_onAddorRemoveWishlistItem);
  }

  Future<void> _onFetchWishlistProducts(
      FetchWishlistProducts event, Emitter<WishlistProductState> emit) async {
    emit(WishlistProductLoading());
    try {
      final List<Product> products = await wishlistApiService.getWishlistProduct();
      
      emit(WishlistProductLoaded(products: products));
    } catch (e) {
      emit(WishlistProductError(message: e.toString()));
    }
  }

  Future<void> _onAddorRemoveWishlistItem(
      AddorRemoveWishlistItemEvent event, Emitter<WishlistProductState> emit) async {
    try {
      final String message = await wishlistApiService.addRemoveWhishlist(event.productId);
      
      emit(AddorRemoveWishlistItemState(message: message));
    } catch (e) {
      emit(WishlistProductError(message: e.toString()));
    }
  }
}
