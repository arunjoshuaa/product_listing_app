import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Add this import for Bloc
import 'package:product_listing_app/blocs/wishlist/wishlist_product_bloc.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_event.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_state.dart'; // Import state

class ProductCardWidget extends StatefulWidget {
  final String? id;
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
    this.id,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

// In product_listing_app/screens/widgets/product_card_widget.dart

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return BlocConsumer<WishlistProductBloc, WishlistProductState>(
      listener: (context, state) {
        // Handle state changes (success or error)
        if (state is WishlistProductError) {
          // Show error if something goes wrong
          Text(state.message);
        }

        // Handle success from the AddorRemoveWishlistItemEvent
        if (state is AddorRemoveWishlistItemState) {
          // This listener is called whenever the state changes to AddorRemoveWishlistItemState.
          // The context here is already valid, so no need for if (mounted).
          // You should show the SnackBar here.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product removed from favorites')),
          );
        }
      },
      builder: (context, state) {
        return Card(
          elevation: 0,
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Image.network(widget.image, fit: BoxFit.cover),
                    ),
                  ),
                  if (widget.isFavouriteButtonVisible)
                    Positioned(
                      top: 1,
                      right: 1,
                      child: IconButton(
                        onPressed: () {
                          context.read<WishlistProductBloc>().add(
                            AddorRemoveWishlistItemEvent(productId: widget.id!),
                          );
                          // It's not a good practice to trigger another event right after the first one.
                          // The 'AddorRemoveWishlistItemEvent' should handle its logic and
                          // its resulting state should trigger the UI update.
                          // You should remove the following line:
                          // context.read<WishlistProductBloc>().add(FetchWishlistProducts());
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
                            "\u{20B9}${widget.price}\t",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "\u{20B9}${widget.offerPrice}",
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
