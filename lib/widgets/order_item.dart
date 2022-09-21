import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  const OrderItem({Key key, this.order}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        ListTile(
          title: Text('\$${widget.order.amount}'),
          subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
          trailing: IconButton(
            icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onPressed: (() {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            }),
          ),
        ),
        if (_isExpanded)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: min(widget.order.products.length * 20.0 + 10, 100),
            child: ListView(
              children: widget.order.products
                  .map(
                    (prod) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          prod.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${prod.quantity}x \$${prod.price}',
                          style: TextStyle(fontSize: 18, color: Colors.pink),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
      ]),
    );
  }
}
