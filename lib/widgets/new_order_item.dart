import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewOrderItem extends StatefulWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;
  final String imgUrl;
  NewOrderItem(this.id, this.price, this.quantity, this.title, this.productId,
      this.imgUrl);

  @override
  State<NewOrderItem> createState() => _NewOrderItemState();
}

class _NewOrderItemState extends State<NewOrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.quantity}x ${widget.title}',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              Text(
                widget.price.toString(),
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
