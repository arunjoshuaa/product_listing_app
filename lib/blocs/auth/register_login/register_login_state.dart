import 'package:equatable/equatable.dart';
abstract class RegisterLoginState extends Equatable {
  @override
  List<Object>get props=>[];
}
class RegisterLoginInitalState extends RegisterLoginState{}
class RegisterLoginLoadingState extends RegisterLoginState{}
class RegisterLoginSuccessState extends RegisterLoginState{
  final String accessToken;
  RegisterLoginSuccessState({required this.accessToken});
  @override
  List<Object>get props=>[accessToken];
}
class RegisterLoginErrorState extends RegisterLoginState{
  final String message;
  RegisterLoginErrorState({required this.message});
  @override
  List<Object>get props=>[message];
}
