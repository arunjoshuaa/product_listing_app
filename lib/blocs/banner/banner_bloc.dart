import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/banner/banner_event.dart';
import 'package:product_listing_app/blocs/banner/banner_state.dart';
import 'package:product_listing_app/repositories/banner_api_service.dart';

class BannerBloc extends Bloc<BannerEvent,BannerState> {
  final BannerApiService bannerApiService;

  BannerBloc({required this.bannerApiService}):super(BannerInitalState()){
on<FetchBannersEvent>(_onFetchedBanner);
  }
  Future _onFetchedBanner (FetchBannersEvent event, Emitter<BannerState> emit)async{
    emit(BannerLoadingState());
    try{
      final banners=await bannerApiService.fetchBanner();
      emit(BannerLoadedState(banners));
    }catch(e){
      emit(BannerErrorState(e.toString()));
    }
  }

}