import 'package:equatable/equatable.dart';
import 'package:product_listing_app/models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
   final Map<String, List<Product>> groupedProducts;
  const ProductLoaded({required this.groupedProducts});
    @override
  List<Object> get props => [groupedProducts];


}

class ProductError extends ProductState {
  final String message;
  const ProductError({required this.message});

  @override
  List<Object> get props => [message];
}
