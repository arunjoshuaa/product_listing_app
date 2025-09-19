import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/auth/register_login/register_login_event.dart';
import 'package:product_listing_app/blocs/auth/register_login/register_login_state.dart';
import 'package:product_listing_app/core/storage_service.dart';
import 'package:product_listing_app/repositories/auth_api_service.dart';
class RegisterLoginBloc extends Bloc<RegisterLoginEvent, RegisterLoginState> {
  final AuthApiService registerLoginApiService;
  final SecureStorageService secureStorageService;
  RegisterLoginBloc({
    required this.registerLoginApiService,
    required this.secureStorageService,
  }) : super(RegisterLoginInitalState()) {
    on<RegisterLoginSubmitEvent>(_onRegisterLoginSubmitter);
  }
  Future _onRegisterLoginSubmitter(
    RegisterLoginSubmitEvent event,
    Emitter<RegisterLoginState> emit,
  ) async {
    try {
      final response = await registerLoginApiService.loginRegister(
        event.phoneNumber,
        event.name,
      );
      final accessToken = response['token']['access'];
      if (accessToken != null) {
        print("AccessToken got$accessToken");
        await secureStorageService.saveToken(accessToken);
        emit(RegisterLoginSuccessState(accessToken: accessToken));
      } else {
        emit(RegisterLoginErrorState(message: 'Access Token Not Found'));
      }
    } catch (e) {
      emit(RegisterLoginErrorState(message: e.toString()));
    }
  }
}
