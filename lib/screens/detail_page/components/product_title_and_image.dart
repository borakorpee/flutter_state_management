import 'package:flutter/material.dart';

import '../../../app_thema/app_thema.dart';
import '../../../models/product.dart';

class ProductTitleAndImage extends StatelessWidget {
  const ProductTitleAndImage({
    Key key,
    @required this.loadedProduct,
    @required this.app_thema,
    this.activeColor_index,
  }) : super(key: key);

  final Product loadedProduct;
  final appThema app_thema;
  final int activeColor_index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FittedBox(
            child: Text(
              loadedProduct.description,
              style: TextStyle(color: app_thema.white),
            ),
          ),
          FittedBox(
            child: Text(
              loadedProduct.title,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: app_thema.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 60),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${loadedProduct.price} ",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: app_thema.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 40),
              Expanded(
                child: Image.network(
                  loadedProduct.productPhotos[activeColor_index],
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
