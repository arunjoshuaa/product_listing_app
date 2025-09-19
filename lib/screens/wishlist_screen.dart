import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_bloc.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_event.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_state.dart';
import 'package:product_listing_app/screens/home_screen.dart';
import 'package:product_listing_app/screens/widgets/product_grid_list.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        context.read<WishlistProductBloc>().add(FetchWishlistProducts()); 
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Whishlist"),),
      body:    BlocBuilder<WishlistProductBloc, WishlistProductState>(
        builder: (context, state) {
           if (state is WishlistProductLoading) {
            return Center(child:CircularProgressIndicator());
           }
           else if(state is WishlistProductLoaded){
            return ProductGrid(products: state.products);
           }
           else if(state is WishlistProductError){
            return Center(child: Text(state.message),);
           }
           return SizedBox.shrink();
        })
      );
     //   child: Center(child: Text("Wishlist Screen"),)),);
  }
}