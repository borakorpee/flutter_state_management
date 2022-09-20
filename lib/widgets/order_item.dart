import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;
  const OrderItem({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        ListTile(
          title: Text('\$${order.amount}'),
          subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(order.dateTime)),
          trailing: IconButton(
            icon: Icon(Icons.expand_more),
            onPressed: (() {}),
          ),
        )
      ]),
    );
  }
}
