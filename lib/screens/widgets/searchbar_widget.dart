import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/search/search_bloc.dart';
import 'package:product_listing_app/blocs/search/search_event.dart';

class SearchbarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String)? onChanged;

  const SearchbarWidget({
    Key? key,
    required this.searchController,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        elevation: 10.0,
        child: TextFormField(
          controller: searchController,
          onChanged: onChanged, // 🔥 handle changes here
          decoration: InputDecoration(
            hintText: "Search",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            suffixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
