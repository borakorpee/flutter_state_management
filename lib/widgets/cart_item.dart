// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;
  final String imgUrl;

  CartItem(
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
    this.imgUrl,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 31,
        right: 31,
        bottom: 22,
      ),
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: 365,
            height: 135,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 17, bottom: 5, top: 4, right: 10),
                    child: SizedBox(
                      width: 100,
                      height: 95,
                      child: Image.network(imgUrl),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 19),
                    child: VerticalDivider(
                      thickness: 2,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, right: 15, left: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: GoogleFonts.dmSans(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            width: 150,
                            height: 51,
                            child: Expanded(
                              child: Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                                softWrap: false,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.dmSans(
                                    fontSize: 9, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Text(
                            price.toString(),
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Provider.of<Cart>(context, listen: false)
                      .removeItem(productId);
                },
                child: Container(
                  width: 21,
                  height: 21,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )),
        ],
      ),
    ); /*Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure'),
                  content:
                      Text('Do you want to remove the item from the cart?'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text('Yes'))
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Container(
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );*/
  }
}
