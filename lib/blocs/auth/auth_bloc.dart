

// import 'package:product_listing_app/blocs/auth/auth_event.dart';
// import 'package:product_listing_app/blocs/auth/auth_state.dart';

// class LoginBloc extends bloc<AuthEvent, LoginState> {
//   final ApiService apiService;

//   LoginBloc(this.apiService) : super(LoginInitial()) {
//     on<LoginButtonPressed>((event, emit) async {
//       emit(LoginLoading());

//       try {
//         final response = await apiService.login(event.email, event.password);
//         emit(LoginSuccess(response));
//       } catch (e) {
//         emit(LoginFailure(e.toString()));
//       }
//     });
//   }
// }
