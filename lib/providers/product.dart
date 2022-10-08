import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    this.description,
    this.longDescription,
    @required this.price,
    @required this.imageUrl,
    this.color,
    this.colorOptions,
    this.productPhotos,
    this.isFavorite = false,
  });

  Future<void> toggleFavorite(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://flutter-shop-app-79429-default-rtdb.europe-west1.firebasedatabase.app/userFavorites/$userId/$id.json?auth=$token';
    try {
      await http.put(
        Uri.parse(url),
        body: json.encode(
          isFavorite,
        ),
      );
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
