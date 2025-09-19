
import 'package:flutter/widgets.dart';
import 'package:product_listing_app/models/product_model.dart';
import 'package:product_listing_app/screens/widgets/product_card_widget.dart';

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
            id:product.id,
            price: product.mrp.toString(),
            offerPrice: product.salePrice.toString(),
            rating: product.avgRating.toString(),
            image: product.featuredImage, // Now uses API data
            productName: product.name, // Now uses API data
            isFavorite: product.in_wishlist,
          );
        },
      ),
    );
  }
}