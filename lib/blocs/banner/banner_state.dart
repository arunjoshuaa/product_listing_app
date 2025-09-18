import 'package:equatable/equatable.dart';
import 'package:product_listing_app/models/banner_model.dart';

abstract class BannerState extends Equatable {

@override
  List<Object>get props=>[];
}

class BannerInitalState extends BannerState{}
class BannerLoadingState extends BannerState{}
class BannerLoadedState extends BannerState{
  final List<BannerModel>banners;
  BannerLoadedState(this.banners);
  @override
  List<Object>get props=>[banners];
}
class BannerErrorState extends BannerState{
  final String message;
  BannerErrorState(this.message);
  @override
  List<Object> get props=>[message];
}