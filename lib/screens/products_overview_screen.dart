import 'package:flutter/material.dart';

import '../app_thema/app_thema.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final appThema app_thema = appThema();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_thema.dark,
      appBar: CustomAppBar(app_thema, 'Home Page'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
          child: ProductsGrid(),
        ),
      ),
    );
  }
}
