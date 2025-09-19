import 'package:equatable/equatable.dart';
abstract class VerificationEvent extends Equatable{
  @override
  List<Object> get props=>[];
}
class VerifyPhoneNumberEvent extends VerificationEvent{
  final String phoneNumber;
  VerifyPhoneNumberEvent(this.phoneNumber);
  @override
  List<Object>get props=>[phoneNumber];
}