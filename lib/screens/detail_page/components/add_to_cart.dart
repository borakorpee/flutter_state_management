// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_thema/app_thema.dart';
import '../../../providers/cart.dart';
import '../../../providers/product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    this.loadedProduct,
    this.activeColor_index,
    this.app_thema,
    this.itemCount,
  }) : super(key: key);

  final Product loadedProduct;
  final int activeColor_index;
  final appThema app_thema;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Text(itemCount.toString()),
          Container(
              margin: EdgeInsets.only(right: 20),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                    color: loadedProduct.colorOptions[activeColor_index]),
              ),
              child: RawMaterialButton(
                onPressed: () {
                  cart.addItem(loadedProduct.id, loadedProduct.price,
                      loadedProduct.title);
                },
                constraints: BoxConstraints(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: loadedProduct.colorOptions[activeColor_index],
                ),
                padding: EdgeInsets.all(8),
              )),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: loadedProduct.colorOptions[activeColor_index],
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: app_thema.white),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
