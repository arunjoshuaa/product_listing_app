// lib/bloc/product_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/product/product_event.dart';
import 'package:product_listing_app/blocs/product/product_state.dart';
import 'package:product_listing_app/blocs/user/user_event.dart';
import 'package:product_listing_app/blocs/user/user_state.dart';

import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/models/user_model.dart';
import 'package:product_listing_app/repositories/produc_api_service.dart';
import 'package:product_listing_app/repositories/profie_api_service.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final  ProfieApiService profileApiService;

  UserBloc({required this.profileApiService}) : super(UserInitalState()) {
    on<FetchUserEvent>(_onFetchUser);
  }

  Future<void> _onFetchUser(
      FetchUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final user = await profileApiService.getProfile();
      emit(UserLoadedState(user: user));
   
  

    } catch (e) {
      emit(UserErrorState(message: e.toString()));
    }
  }
}
