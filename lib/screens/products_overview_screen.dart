import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../app_thema/app_thema.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;
  final appThema app_thema = appThema();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_thema.dark,
      appBar: AppBar(
        title: Text("asd"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.All) {
                  _showFavoritesOnly = false;
                } else {
                  _showFavoritesOnly = true;
                }
                ;
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
              PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
          child: ProductsGrid(_showFavoritesOnly),
        ),
      ),
    );
  }
}
