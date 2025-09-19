import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object>get props=>[];
}

class UserInitalState extends UserState{}
class UserLoadingState extends UserState{}
class UserLoadedState extends UserState{
  final user;
  UserLoadedState({required this.user});
    @override
  List<Object>get props=>[user];
}
class UserErrorState extends UserState{
  final String message;
  UserErrorState({required this.message});
  @override
  List<Object>get props=>[message];
}

