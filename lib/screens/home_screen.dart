import 'package:flutter/material.dart';
import 'package:product_listing_app/screens/widgets/banner_carousel_widget.dart';
import 'package:product_listing_app/screens/widgets/product_card_widget.dart';
import 'package:product_listing_app/screens/widgets/searchbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List productNames = [
    "Grain Peppers",
    "Organic Dry Turmeric",
    "Jaggery Powder",
    "Coriander Powder",
  ];
  List images = [
    'assets/images/coriander.png',
    'assets/images/jaggery.png',
    'assets/images/pepper.png',
    'assets/images/turmeric.png',
  ];
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
              const SizedBox(height: 200, child: BannerCarouselWidget()),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Popular Products",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                ],
              ),

              SizedBox(
                height: 680,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 250,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ProductCardWidget(
                      price: '300',
                      offerPrice: '200',
                      rating: '4.5',
                      image: images[index],
                      productName: productNames[index],
                      isFavorite: false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
