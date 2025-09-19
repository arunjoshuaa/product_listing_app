

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/search/search_event.dart';
import 'package:product_listing_app/blocs/search/search_state.dart';
import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/repositories/search_api_service.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchApiService searchApiService;

  SearchBloc({required this.searchApiService}) : super((SearchtInitalState())) {
    on<SearchProductEvent>(_onSearchProducts);
  }

  Future<void> _onSearchProducts(
      SearchProductEvent event, Emitter<SearchState> emit) async {
    emit(SearchingState());
    try {
      final List<Product> products = await searchApiService.searchQuery(event.query);
      
      emit(SearchCompleteState(products: products));
    } catch (e) {
      emit(SearchErrorState(message: e.toString()));
    }
  }

}
