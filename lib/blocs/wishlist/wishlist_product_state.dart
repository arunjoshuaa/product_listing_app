import 'package:equatable/equatable.dart';
import 'package:product_listing_app/models/product_model.dart';

abstract class WishlistProductState extends Equatable {
  const WishlistProductState();

  @override
  List<Object> get props => [];
}

class WishlistProductInitial extends WishlistProductState {}

class WishlistProductLoading extends WishlistProductState {}

class WishlistProductLoaded extends WishlistProductState {
   final List<Product> products;
  const WishlistProductLoaded({required this.products});
    @override
  List<Object> get props => [products];


}

class WishlistProductError extends WishlistProductState {
  final String message;
  const WishlistProductError({required this.message});

  @override
  List<Object> get props => [message];
}
class AddorRemoveWishlistItemState extends WishlistProductState{
  final String message;
    const AddorRemoveWishlistItemState({required this.message});
  @override
  List<Object> get props => [message];
}

