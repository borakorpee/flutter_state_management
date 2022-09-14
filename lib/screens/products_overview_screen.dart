import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import '../app_thema/app_thema.dart';
import '../widgets/custom_appbar.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final appThema app_thema = appThema();
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://www.freeiconspng.com/thumbs/bag-png/clothing-bag-png-1.png',
      color: Colors.brown,
    ),
    Product(
      id: 'p2',
      title: 'Phone',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://www.kvk.com/images/Product/23032022120708_koknaryesili1%20kopyas%C4%B1.png?undefined=undefined',
      color: Color.fromARGB(255, 88, 99, 85),
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://www.fitbit.com/global/content/dam/fitbit/global/marketing-pages/home/tablet/home-product-tile-smartwatches-sense2-fall22.png',
      color: Colors.black38,
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0573/2309/4216/products/LosAngeles_SandGold_001.png?v=1650876856',
      color: Colors.grey[600],
    ),
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://www.freeiconspng.com/thumbs/bag-png/clothing-bag-png-1.png',
      color: Colors.brown,
    ),
    Product(
      id: 'p2',
      title: 'Phone',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://www.kvk.com/images/Product/23032022120708_koknaryesili1%20kopyas%C4%B1.png?undefined=undefined',
      color: Color.fromARGB(255, 88, 99, 85),
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://www.fitbit.com/global/content/dam/fitbit/global/marketing-pages/home/tablet/home-product-tile-smartwatches-sense2-fall22.png',
      color: Colors.black38,
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0573/2309/4216/products/LosAngeles_SandGold_001.png?v=1650876856',
      color: Colors.grey[600],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_thema.dark,
      appBar: CustomAppBar(app_thema),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
          child: GridView.builder(
            itemCount: loadedProducts.length,
            itemBuilder: (ctx, index) => ProductItem(
              loadedProducts[index].id,
              loadedProducts[index].title,
              loadedProducts[index].imageUrl,
              loadedProducts[index].color,
              loadedProducts[index].price,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          ),
        ),
      ),
    );
  }
}
