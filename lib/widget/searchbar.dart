import 'package:flutter/material.dart';

Widget createSearchBar() {
  return Padding(
    padding: EdgeInsets.only(top: 15, left: 18, right: 18),
    child: TextField(
      decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade50))),
    ),
  );
}
