import 'package:flutter/material.dart';
import '../app_thema/app_thema.dart';
import '../screens/detail_page/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final appThema app_thema = appThema();
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  final Color product_color;

  ProductItem(
      this.id, this.title, this.imageUrl, this.product_color, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ProductDetailScreen(id),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: product_color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Hero(
                        tag: "${id}",
                        child: Image.network(imageUrl),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: FittedBox(
                    child: Text(
                      title,
                      style: TextStyle(color: app_thema.text, fontSize: 16),
                    ),
                  ),
                ),
                Text(
                  " \$ ${price}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: app_thema.text,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
