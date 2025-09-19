import 'package:equatable/equatable.dart';

abstract class WishlistProductEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchWishlistProducts extends WishlistProductEvent{}

class AddorRemoveWishlistItemEvent extends WishlistProductEvent{
  final String productId;
  AddorRemoveWishlistItemEvent({required this.productId});
    @override
  List<Object> get props => [productId];
}


