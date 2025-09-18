import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/banner/banner_bloc.dart';
import 'package:product_listing_app/blocs/banner/banner_state.dart';
import 'package:product_listing_app/blocs/product/product_bloc.dart';
import 'package:product_listing_app/blocs/product/product_event.dart';
import 'package:product_listing_app/blocs/product/product_state.dart';
import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/repositories/produc_api_service.dart';
import 'package:product_listing_app/screens/widgets/banner_carousel_widget.dart';
import 'package:product_listing_app/screens/widgets/product_card_widget.dart';
import 'package:product_listing_app/screens/widgets/searchbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List popularProductNames = [
  //   "Grain Peppers",
  //   "Organic Dry Turmeric",
  //   "Jaggery Powder",
  //   "Coriander Powder",
  // ];
  //   List latestProductNames = [
  //   "Grain Peppers",
  //   "Organic Dry Turmeric",
  //   "Jaggery Powder",
  //   "Coriander Powder",
  // ];
  // List popularProductImages = [
  //   'assets/images/coriander.png',
  //   'assets/images/jaggery.png',
  //   'assets/images/pepper.png',
  //   'assets/images/turmeric.png',
  // ];
  //   List latestProductImages = [
  //   'assets/images/coriander.png',
  //   'assets/images/jaggery.png',
  //   'assets/images/pepper.png',
  //   'assets/images/turmeric.png',
  // ];
  // List categoryName=['Popular','Latest',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              const SearchbarWidget(),
              const SizedBox(height: 20),
               SizedBox(height: 200, child: BlocBuilder<BannerBloc,BannerState>(
                builder: (context, state) {
                  if(state is BannerLoadingState){
                    return Center(child: CircularProgressIndicator(),) ;
                  }
                  else if(state is BannerLoadedState){
                        return  BannerCarouselWidget(banners: state.banners,);
                  }
                  else if(state is BannerErrorState){
                    return Center(child: Text(state.message),);
                  }
                  return SizedBox.shrink();
                 
                },
        
                )),
              const SizedBox(height: 20),
                // Loop through category names and display each one
            // for (int index = 0; index < categoryName.length; index++) 
            //   Component(categoryName:categoryName[index],popularProductImages: popularProductImages, popularProductNames: popularProductNames),
    
    
        // Use BlocBuilder to dynamically render the content
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    return Column(
                      children: state.groupedProducts.entries.map((entry) {
                        return Column(
                          children: [
                            ProductListSection(
                              categoryName: entry.key,
                              products: entry.value,
                            ),
                       
                          ],
                        );
                      }).toList(),
                    );
                  } else if (state is ProductError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                return const SizedBox.shrink();
                },
              ),
    
    
          
              //            const Row(
              //   children: [
              //     Text(
              //       "Latest Products",
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     SizedBox(height: 20),
              //   ],
              // ),
                            // GridCards(images: latestProductImages, productNames: latestProductNames),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListSection extends StatelessWidget {
  final String categoryName;
  final List<Product> products;

  const ProductListSection({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Text(
          categoryName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        ProductGrid(products: products),
      ],
    );
  }
}

// class Component extends StatelessWidget {
//   const Component({
//     super.key,
//     required this.popularProductImages,
//     required this.popularProductNames,
//     required this.categoryName
//   });

//   final List popularProductImages;
//   final List popularProductNames;
//   final String categoryName;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//          Row(
//           children: [
//             Text(categoryName,
              
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//         GridCards(images: popularProductImages, productNames: popularProductNames),
//       ],
//     );
//   }
// }

// class GridCards extends StatelessWidget {
//   const GridCards({
//     super.key,
//     required this.images,
//     required this.productNames,
//   });

//   final List images;
//   final List productNames;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 530,
//       child: GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 5,
//           mainAxisExtent: 240,
//         ),
//         itemCount: images.length,
//         itemBuilder: (context, index) {
//           return ProductCardWidget(
//             price: '300',
//             offerPrice: '200',
//             rating: '4.5',
//             image: images[index],
//             productName: productNames[index],
//             isFavorite: false,
//           );
//         },
//       ),
//     );
//   }
// }

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
      
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
          mainAxisExtent: 240,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCardWidget(
            price: product.mrp.toString(),
            offerPrice: product.salePrice.toString(),
            rating: product.avgRating.toString(),
            image: product.featuredImage, // Now uses API data
            productName: product.name, // Now uses API data
            isFavorite: false,
          );
        },
      ),
    );
  }
}