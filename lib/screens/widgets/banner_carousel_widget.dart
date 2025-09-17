import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:product_listing_app/screens/widgets/custom_button_widget.dart'; 

class BannerCarouselWidget extends StatefulWidget {
  const BannerCarouselWidget({super.key});

  @override
  State<BannerCarouselWidget> createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  
  final List<Map<String, String>> bannerData = [
    {
      "title": "Paragon Kitchen - Lulu Mall",
      "subtitle": "Flat 50% Off!",
      "image": "assets/images/bannerimagesmall.png",
    },
    {
      "title": "Paragon Kitchen - Lulu Mall",
      "subtitle": "Flat 50% Off!",
      "image": "assets/images/bannerimagesmall.png",
    },
        {
      "title": "Paragon Kitchen - Lulu Mall",
      "subtitle": "Flat 50% Off!",
      "image": "assets/images/bannerimagesmall.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, 
      child: Swiper(
        transformer: ScaleAndFadeTransformer(),
        duration: 1000,
        autoplay: true,
        pagination: SwiperPagination(
           builder: DotSwiperPaginationBuilder(),
        ),
        axisDirection: AxisDirection.right,
        itemCount: bannerData.length,
        itemBuilder: (context, index) {
          final banner = bannerData[index];
          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                
                Positioned(
                  left: 20,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        banner['title']!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        banner['subtitle']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {}, 
                        child: const Text("KNOW MORE"),
                      ),
                    ],
                  ),
                ),

                
                Positioned(
                  right: 0,
                      
              child: Container(
                
  height: 193,  
  width: 130,   
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage(banner['image']!)),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(10),
      bottomRight: Radius.circular(10),
      topLeft: Radius.circular(100),
      bottomLeft: Radius.circular(100),
    ),
    color: Color(0xFFFD8DEF4),
  ),

),

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
