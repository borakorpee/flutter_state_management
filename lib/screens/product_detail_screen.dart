import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_thema/app_thema.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final appThema app_thema = appThema();
  final String id;

  ProductDetailScreen(this.id);
  @override
  Widget build(BuildContext context) {
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(id);
    return Scaffold(
      backgroundColor: loadedProduct.color,
      appBar: AppBar(
        backgroundColor: loadedProduct.color,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }
}
