import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Fancy Bag',
      description: 'A red shirt - it is pretty red!',
      longDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget efficitur metus. Vestibulum venenatis nisl id tincidunt blandit. Proin risus dui, ultricies sit amet mi quis, pellentesque dignissim massa. Duis quis ligula ut tortor ornare venenatis. Fusce nec tincidunt est. Pellentesque venenatis odio auctor accumsan congue.",
      price: 29.99,
      imageUrl:
          'https://www.freeiconspng.com/thumbs/bag-png/clothing-bag-png-1.png',
      color: Colors.brown,
      productPhotos: [
        "https://www.freeiconspng.com/thumbs/bag-png/clothing-bag-png-1.png",
      ],
      colorOptions: [
        Color.fromRGBO(139, 38, 43, 1),
      ],
    ),
    Product(
      id: 'p2',
      title: 'iPhone 14 Pro Max',
      description: 'Smarter then ever',
      longDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget efficitur metus. Vestibulum venenatis nisl id tincidunt blandit. Proin risus dui, ultricies sit amet mi quis, pellentesque dignissim massa. Duis quis ligula ut tortor ornare venenatis. Fusce nec tincidunt est. Pellentesque venenatis odio auctor accumsan congue.",
      price: 499.99,
      imageUrl:
          'https://static1.pocketnowimages.com/wordpress/wp-content/uploads/2022/09/PBI-iPhone-14-Deep-Purple-1.png?q=50&fit=crop&w=1920&dpr=1.5',
      color: Color.fromRGBO(77, 66, 83, 1),
      productPhotos: [
        'https://static1.pocketnowimages.com/wordpress/wp-content/uploads/2022/09/PBI-iPhone-14-Deep-Purple-1.png?q=50&fit=crop&w=1920&dpr=1.5',
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro-max-gold-select?wid=940&hei=1112&fmt=png-alpha&.v=1660777235605',
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro-spaceblack-select?wid=940&hei=1112&fmt=png-alpha&.v=1660777235198',
        'https://d1erhn8sljv386.cloudfront.net/CA-HugmnEptyeQ9bJSwBeExZy9Q=/fit-in/1000x1000/filters:format(webp)/https://s3.amazonaws.com/lmbucket0/media/product/t-mobile-apple-iphone-14-pro-max-frontimage-silver.png',
      ],
      colorOptions: [
        Color.fromRGBO(77, 66, 83, 1),
        Color.fromARGB(255, 233, 203, 143),
        Color.fromRGBO(49, 47, 46, 1),
        Colors.grey,
      ],
    )
  ];

  //var _showFavoritesOnly = false;
  bool isFav(String id) {
    Product prod = _items.firstWhere((element) => element.id == id);
    return prod.isFavorite;
  }

  void toggleFavoritee(String id) {
    Product prod = _items.firstWhere((element) => element.id == id);
    prod.isFavorite = !prod.isFavorite;
    notifyListeners();
  }

  List<Product> get items {
    /*if (_showFavoritesOnly) {
      return [..._items].where((proditem) => proditem.isFavorite).toList();
    }*/
    return [..._items];
  }

  List<Product> get favoriteItems {
    return [..._items].where((proditem) => proditem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    const url =
        'https://flutter-shop-app-79429-default-rtdb.europe-west1.firebasedatabase.app/products.json';
    http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'title': product.title,
          'description': product.description,
          'imageURL': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        },
      ),
    );
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {}
  }

  void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
  /*void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }*/
}
