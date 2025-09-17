import 'package:flutter/material.dart';

class ProductCardWidget extends StatefulWidget {
  final String price;
  final String offerPrice;
  final String rating;
  final String image;
  final bool isFavouriteButtonVisible;
  bool isFavorite;
  final String productName;

  ProductCardWidget({
    super.key,
    required this.price,
    required this.offerPrice,
    required this.rating,
    required this.image,
    this.isFavouriteButtonVisible = true,
    required this.productName,
    required this.isFavorite,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.asset(widget.image, fit: BoxFit.fill),
              ),
              if (widget.isFavouriteButtonVisible)
                Positioned(
                  top: 1,
                  right: 1,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.isFavorite = !widget.isFavorite;
                      });
                    },
                    icon: widget.isFavorite
                        ? Image.asset('assets/images/like_small.png')
                        : Image.asset('assets/images/unlike_small.png'),
                    iconSize: 10,
                  ),
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "\u{20B9} ${widget.price}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\u{20B9} ${widget.offerPrice}",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, color: Color(0xFFFFA964C)),
                      Text(widget.rating),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Text(
                    widget.productName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
