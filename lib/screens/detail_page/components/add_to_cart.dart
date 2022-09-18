// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../app_thema/app_thema.dart';
import '../../../providers/product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.loadedProduct,
    @required this.activeColor_index,
    @required this.app_thema,
  }) : super(key: key);

  final Product loadedProduct;
  final int activeColor_index;
  final appThema app_thema;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  color: loadedProduct.colorOptions[activeColor_index]),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart_outlined,
                color: loadedProduct.colorOptions[activeColor_index],
              ),
              onPressed: () {},
            ),
          ),
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
          )
        ],
      ),
    );
  }
}
