import 'package:equatable/equatable.dart';

abstract class VerificationState extends Equatable {
  @override
  List<Object>get props=>[];
} 

class VerificationIntialState extends VerificationState{}
class VerificationLoadingState extends VerificationState{}
class VerificationSuccessState extends VerificationState{
  final String otp;
  final bool user; 
  VerificationSuccessState({required this.otp,required this.user});
  @override
  List<Object>get props=>[otp,user];
}
class VerificationErrorState extends VerificationState{
  final String message;
  VerificationErrorState(this.message);
  @override
  List<Object>get props=>[message];
}