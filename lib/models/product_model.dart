
class Product {

  final String name;
  final String caption;
  final String featuredImage;
  final num salePrice;
  final num mrp;
  final double avgRating;
  final String productType;

  Product({
 
    required this.name,
    required this.caption,
    required this.featuredImage,
    required this.salePrice,
    required this.mrp,
    required this.avgRating,
    required this.productType,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      caption: json['caption'] as String,
      featuredImage: json['featured_image'] as String,
      salePrice: (json['sale_price'] as num),
      mrp: (json['mrp'] as num),
      avgRating: (json['avg_rating'] as num).toDouble(),
      productType: json['product_type'] as String,
    );
  }
}
