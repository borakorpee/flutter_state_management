// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_thema/app_thema.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String id;

  ProductDetailScreen(this.id);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int activeColor_index = 0;
  final appThema app_thema = appThema();

  @override
  Widget build(BuildContext context) {
    int numOfItems = 1;
    final size = MediaQuery.of(context).size;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(widget.id);
    return Scaffold(
      backgroundColor: loadedProduct.colorOptions[activeColor_index],
      appBar: AppBar(
        backgroundColor: loadedProduct.colorOptions[activeColor_index],
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: size.height * 0.12, left: 20, right: 20),
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Color"),
                                Row(
                                  children: [
                                    ...List.generate(
                                        loadedProduct.colorOptions.length,
                                        (index) {
                                      return GestureDetector(
                                        onTap: (() {
                                          setState(() {
                                            activeColor_index = index;
                                          });
                                        }),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 5, right: 10),
                                          padding: EdgeInsets.all(2.5),
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: activeColor_index == index
                                                  ? loadedProduct.color
                                                  : Colors.transparent,
                                            ),
                                          ),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: loadedProduct
                                                  .colorOptions[index],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(loadedProduct.longDescription,
                              style: TextStyle(height: 1.5)),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 40,
                              height: 32,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13))),
                                onPressed: () {
                                  setState(() {
                                    numOfItems--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                numOfItems.toString().padLeft(2, "0"),
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              height: 32,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13))),
                                onPressed: () {
                                  numOfItems++;
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        Padding(
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
                                      color: loadedProduct
                                          .colorOptions[activeColor_index]),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: loadedProduct
                                        .colorOptions[activeColor_index],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    color: loadedProduct
                                        .colorOptions[activeColor_index],
                                    child: Text(
                                      "Buy Now".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: app_thema.text),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            loadedProduct.description,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          loadedProduct.title,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Image.network(
                                loadedProduct.imageUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
