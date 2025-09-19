
class Product {
  final String id;
  final String name;
  final String caption;
  final String featuredImage;
  final num salePrice;
  final num mrp;
  final double avgRating;
  final String productType;
  final bool in_wishlist;

  Product({
     required this.id,
    required this.name,
    required this.caption,
    required this.featuredImage,
    required this.salePrice,
    required this.mrp,
    required this.avgRating,
    required this.productType,
    required this.in_wishlist
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
  id: json['id'].toString(),  // Convert id to String    
    name: json['name'] as String,
      caption: json['caption'] as String,
      featuredImage: json['featured_image'] as String,
      salePrice: (json['sale_price'] as num),
      mrp: (json['mrp'] as num),
      avgRating: (json['avg_rating'] as num).toDouble(),
      productType: json['product_type'] as String,
      in_wishlist: json['in_wishlist'] as bool,
    );
  }
}
