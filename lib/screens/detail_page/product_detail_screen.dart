// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/product.dart';
import 'package:provider/provider.dart';
import '../../app_thema/app_thema.dart';
import '../../providers/cart.dart';
import '../../providers/products_provider.dart';
import '../../widgets/badge.dart';
import '../cart_screen.dart';
import 'components/add_to_cart.dart';
import 'components/description.dart';
import 'components/product_title_and_image.dart';

class ProductDetailScreen extends StatefulWidget {
  final String id;
  ProductDetailScreen(this.id);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int activeColor_index = 0;
  int numOfItems = 1;

  final appThema app_thema = appThema();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: true,
    ).findById(widget.id);
    return Scaffold(
      backgroundColor: loadedProduct.colorOptions[activeColor_index],
      appBar: AppBar(
        backgroundColor: loadedProduct.colorOptions[activeColor_index],
        actions: <Widget>[
          IconButton(
            icon: Icon(loadedProduct.isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            onPressed: () {
              Provider.of<Products>(context, listen: false)
                  .toggleFavoritee(loadedProduct.id);
            },
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_sharp),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: size.height * 0.12, left: 20, right: 20),
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ColorOptions(loadedProduct),
                        Description(loadedProduct: loadedProduct),
                        /*ProductCount(),*/
                        Row(
                          children: <Widget>[
                            buildOutlinedButton(Icons.remove, () {
                              if (numOfItems > 1) {
                                setState(() {
                                  numOfItems--;
                                });
                                ;
                              }
                            }),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                numOfItems.toString().padLeft(2, "0"),
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            buildOutlinedButton(Icons.add, () {
                              setState(() {
                                numOfItems++;
                              });
                            }),
                          ],
                        ),
                        AddToCart(
                          loadedProduct: loadedProduct,
                          activeColor_index: activeColor_index,
                          app_thema: app_thema,
                          itemCount: numOfItems,
                        ),
                      ],
                    ),
                  ),
                  ProductTitleAndImage(
                    loadedProduct: loadedProduct,
                    app_thema: app_thema,
                    activeColor_index: activeColor_index,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  ColorOptions(Product loadedProduct) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Color"),
            Row(
              children: [
                ...List.generate(loadedProduct.colorOptions.length, (index) {
                  return GestureDetector(
                    onTap: (() {
                      setState(() {
                        activeColor_index = index;
                      });
                    }),
                    child: Container(
                      margin: EdgeInsets.only(top: 5, right: 10),
                      padding: EdgeInsets.all(2.5),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: activeColor_index == index
                              ? loadedProduct.color
                              : Colors.transparent,
                        ),
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: loadedProduct.colorOptions[index],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ],
        ),
      ],
    );
  }

  buildOutlinedButton(IconData icon, Function press) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13))),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
