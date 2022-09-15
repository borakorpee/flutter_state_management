import 'package:flutter/material.dart';
import '../app_thema/app_thema.dart';
import '../screens/product_detail_screen.dart';

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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: product_color, width: 2)),
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
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(75),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(95),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Image.network(imageUrl),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(color: app_thema.text, fontSize: 16),
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
          Positioned(
            right: 0,
            top: -4,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: app_thema.text,
              ),
            ),
          ),
          Positioned(
            left: -4,
            bottom: 50,
            child: IconButton(
              onPressed: (() {}),
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: app_thema.text,
              ),
            ),
          ),
        ],
      ),
    );

    /*GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        backgroundColor: Colors.black54,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
    );*/
  }
}
