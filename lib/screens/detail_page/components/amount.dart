import 'package:flutter/material.dart';

class ProductCount extends StatefulWidget {
  const ProductCount({Key key}) : super(key: key);

  @override
  State<ProductCount> createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlinedButton(Icons.remove, () {
          if (numOfItems > 1) {
            setState(() {
              numOfItems--;
            });
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
    );
  }
}

buildOutlinedButton(IconData icon, Function press) {
  return SizedBox(
    width: 40,
    height: 32,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
      onPressed: press,
      child: Icon(icon),
    ),
  );
}
