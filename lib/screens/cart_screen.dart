// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_thema/app_thema.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appThema app_thema = appThema();
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Chip(
                  backgroundColor: app_thema.darkest,
                  label: Text(
                    '\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(color: app_thema.white),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false).addOrder(
                      cart.items.values.toList(),
                      cart.totalAmount,
                    );
                    cart.clear();
                  },
                  child: Text('order now'.toUpperCase()),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx, i) => CartItem(
              cart.items.values.toList()[i].id,
              cart.items.values.toList()[i].price,
              cart.items.values.toList()[i].quantity,
              cart.items.values.toList()[i].title,
              cart.items.keys.toList()[i],
            ),
          ),
        ),
      ]),
    );
  }
}
