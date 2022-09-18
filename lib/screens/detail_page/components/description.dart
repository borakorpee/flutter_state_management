import 'package:flutter/material.dart';

import '../../../providers/product.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(loadedProduct.longDescription, style: TextStyle(height: 1.5)),
    );
  }
}
