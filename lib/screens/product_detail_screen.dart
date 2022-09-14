import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';
import '../app_thema/app_thema.dart';

class ProductDetailScreen extends StatelessWidget {
  final appThema app_thema = appThema();
  final String title;

  ProductDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(app_thema, title),
    );
  }
}
