import 'package:equatable/equatable.dart';
import 'package:product_listing_app/models/product_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchtInitalState extends SearchState {}

class SearchingState extends SearchState {}

class SearchCompleteState extends SearchState {
   final List<Product> products;
  const SearchCompleteState({required this.products});
    @override
  List<Object> get props => [products];


}

class SearchErrorState extends SearchState {
  final String message;
  const SearchErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

