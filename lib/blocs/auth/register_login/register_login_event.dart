import 'package:equatable/equatable.dart';

abstract class RegisterLoginEvent extends Equatable {
  @override
  List<Object> get props=>[];
}


class RegisterLoginSubmitEvent extends RegisterLoginEvent{
  final String phoneNumber;
  final String name;
  RegisterLoginSubmitEvent({required this.phoneNumber,required this.name});
  @override
  List<Object>get props=>[phoneNumber,name];
}