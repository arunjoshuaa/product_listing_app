import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/auth/verification/verificarion_state.dart';
import 'package:product_listing_app/blocs/auth/verification/verification_event.dart';
import 'package:product_listing_app/repositories/auth_api_service.dart';

class VerificationBloc extends Bloc<VerificationEvent,VerificationState>{
  final AuthApiService verificationApiService;
  VerificationBloc({required this.verificationApiService}):super(VerificationIntialState()){
on<VerifyPhoneNumberEvent>(_onVerifphoneNumber);
  }
  Future _onVerifphoneNumber(VerifyPhoneNumberEvent event,Emitter<VerificationState>emit)async{
    emit(VerificationLoadingState());
try {
  final data=await verificationApiService.verify(event.phoneNumber);
  if(data!=null){
    emit(VerificationSuccessState(otp: data['otp'], user: data['user']));
  }
} catch (e) {
  emit(VerificationErrorState(e.toString()));
  
}
  }
}