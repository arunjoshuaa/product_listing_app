import 'package:flutter/material.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        elevation: 10.0,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 2, height: 20, color: Colors.black),
                SizedBox(width: 8),
                Icon(Icons.search),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
