import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductEvent{}

class FilterProductsEvent extends ProductEvent {
  final String query;

  FilterProductsEvent({required this.query});
}
