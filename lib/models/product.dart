import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String longDescription;
  final double price;
  final String imageUrl;
  final Color color;
  final List<Color> colorOptions;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.longDescription,
    @required this.price,
    @required this.imageUrl,
    @required this.color,
    @required this.colorOptions,
    this.isFavorite = false,
  });
}
