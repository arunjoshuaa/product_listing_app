import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:product_listing_app/models/banner_model.dart';
import 'package:product_listing_app/screens/widgets/custom_button_widget.dart'; 

class BannerCarouselWidget extends StatefulWidget {
final List<BannerModel> banners;
   BannerCarouselWidget({super.key,required this.banners});

  @override
  State<BannerCarouselWidget> createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  
  // final List<Map<String, String>> bannerData = [
  //   {
  //     "title": "Paragon Kitchen - Lulu Mall",
  //     "subtitle": "Flat 50% Off!",
  //     "image": "assets/images/bannerimagesmall.png",
  //   },
  //   {
  //     "title": "Paragon Kitchen - Lulu Mall",
  //     "subtitle": "Flat 50% Off!",
  //     "image": "assets/images/bannerimagesmall.png",
  //   },
  //       {
  //     "title": "Paragon Kitchen - Lulu Mall",
  //     "subtitle": "Flat 50% Off!",
  //     "image": "assets/images/bannerimagesmall.png",
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, 
      child: Swiper(
        transformer: ScaleAndFadeTransformer(),
        duration: 1000,
        autoplay: true,
        pagination: SwiperPagination(
          margin: EdgeInsetsGeometry.only(top:50 ),
           builder: DotSwiperPaginationBuilder(space:5,color: Colors.grey),
        ),
        axisDirection: AxisDirection.right,
        itemCount: widget.banners.length,
        itemBuilder: (context, index) {
          final  banner = widget.banners[index];
            return ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: Image.network(
      banner.image,
      fit: BoxFit.contain,
      width: double.infinity,
    ),
  );
//           return Card(
//             color: Colors.white,
//             elevation: 4.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             child: Stack(
//               children: [
                
//                 Positioned(
//                   left: 20,
//                   top: 0,
//                   bottom: 0,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         banner.name,
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Flat ${banner.offer}% off!"
//                         ,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {}, 
//                         child: const Text("KNOW MORE"),
//                       ),
//                     ],
//                   ),
//                 ),

                
//                 Positioned(
//                   right: 0,
                      
//               child: Container(
                
//   height: 193,  
//   width: 130,   
//   decoration: BoxDecoration(
//     image: DecorationImage(image: NetworkImage(banner.image)),
//     borderRadius: BorderRadius.only(
//       topRight: Radius.circular(10),
//       bottomRight: Radius.circular(10),
//       topLeft: Radius.circular(100),
//       bottomLeft: Radius.circular(100),
//     ),
//     color: Color(0xFFFD8DEF4),
//   ),

// ),

//                 ),
//               ],
//             ),
//           );
        },
      ),
    );
  }
}
