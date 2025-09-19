import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class SearchProductEvent extends SearchEvent{
  final String query;
  SearchProductEvent({required this.query});
   @override
  List<Object> get props => [query];
}




