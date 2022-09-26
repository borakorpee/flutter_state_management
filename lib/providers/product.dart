import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String longDescription;
  final double price;
  final String imageUrl;
  final Color color;
  final List<Color> colorOptions;
  final List<String> productPhotos;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    this.longDescription,
    @required this.price,
    @required this.imageUrl,
    this.color,
    this.colorOptions,
    this.productPhotos,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
