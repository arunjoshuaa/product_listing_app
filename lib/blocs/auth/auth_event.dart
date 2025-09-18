import 'package:equatable/equatable.dart';
abstract class AuthEvent extends Equatable {
    @override
  List<Object?> get props => [];
}

class LoginButtonPressed extends AuthEvent{
  final String phone_number;
  LoginButtonPressed({required this.phone_number});
    @override
  List<Object?> get props => [phone_number];
}