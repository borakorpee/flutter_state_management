import 'package:flutter/material.dart';
import 'product.dart';

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
    ), /*
    Product(
      id: 'p3',
      title: 'Smart Watch',
      description: 'Warm and cozy - exactly what you need for the winter.',
      longDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget efficitur metus. Vestibulum venenatis nisl id tincidunt blandit. Proin risus dui, ultricies sit amet mi quis, pellentesque dignissim massa. Duis quis ligula ut tortor ornare venenatis. Fusce nec tincidunt est. Pellentesque venenatis odio auctor accumsan congue.",
      price: 19.99,
      imageUrl:
          'https://www.fitbit.com/global/content/dam/fitbit/global/marketing-pages/home/tablet/home-product-tile-smartwatches-sense2-fall22.png',
      color: Color.fromRGBO(61, 60, 61, 1),
      colorOptions: [
        Color.fromRGBO(61, 60, 61, 1),
        Colors.red,
        Colors.black,
        Colors.yellow,
        Colors.cyan
      ],
    ),
    Product(
      id: 'p4',
      title: 'Bluetooth Headphone',
      description: 'Prepare any meal you want.',
      longDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget efficitur metus. Vestibulum venenatis nisl id tincidunt blandit. Proin risus dui, ultricies sit amet mi quis, pellentesque dignissim massa. Duis quis ligula ut tortor ornare venenatis. Fusce nec tincidunt est. Pellentesque venenatis odio auctor accumsan congue.",
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0573/2309/4216/products/LosAngeles_SandGold_001.png?v=1650876856',
      color: Colors.grey[600],
      colorOptions: [
        Colors.grey[600],
        Colors.red,
        Colors.black,
        Colors.yellow,
        Colors.cyan
      ],
    ),
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      longDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget efficitur metus. Vestibulum venenatis nisl id tincidunt blandit. Proin risus dui, ultricies sit amet mi quis, pellentesque dignissim massa. Duis quis ligula ut tortor ornare venenatis. Fusce nec tincidunt est. Pellentesque venenatis odio auctor accumsan congue.",
      price: 29.99,
      imageUrl:
          'https://www.freeiconspng.com/thumbs/bag-png/clothing-bag-png-1.png',
      color: Colors.brown,
      colorOptions: [
        Colors.brown,
        Colors.red,
        Colors.black,
        Colors.yellow,
        Colors.cyan
      ],
    ),
    Product(
      id: 'p2',
      title: 'Phone',
      description: 'A nice pair of trousers.',
      longDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget efficitur metus. Vestibulum venenatis nisl id tincidunt blandit. Proin risus dui, ultricies sit amet mi quis, pellentesque dignissim massa. Duis quis ligula ut tortor ornare venenatis. Fusce nec tincidunt est. Pellentesque venenatis odio auctor accumsan congue.",
      price: 59.99,
      imageUrl:
          'https://www.kvk.com/images/Product/23032022120708_koknaryesili1%20kopyas%C4%B1.png?undefined=undefined',
      color: Color.fromARGB(255, 88, 99, 85),
      colorOptions: [
        Color.fromARGB(255, 88, 99, 85),
        Colors.red,
        Colors.black,
        Colors.yellow,
        Colors.cyan
      ],
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      longDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget efficitur metus. Vestibulum venenatis nisl id tincidunt blandit. Proin risus dui, ultricies sit amet mi quis, pellentesque dignissim massa. Duis quis ligula ut tortor ornare venenatis. Fusce nec tincidunt est. Pellentesque venenatis odio auctor accumsan congue.",
      price: 19.99,
      imageUrl:
          'https://www.fitbit.com/global/content/dam/fitbit/global/marketing-pages/home/tablet/home-product-tile-smartwatches-sense2-fall22.png',
      color: Colors.black38,
      colorOptions: [
        Colors.black38,
        Colors.red,
        Colors.black,
        Colors.yellow,
        Colors.cyan
      ],
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      longDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget efficitur metus. Vestibulum venenatis nisl id tincidunt blandit. Proin risus dui, ultricies sit amet mi quis, pellentesque dignissim massa. Duis quis ligula ut tortor ornare venenatis. Fusce nec tincidunt est. Pellentesque venenatis odio auctor accumsan congue.",
      price: 49.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0573/2309/4216/products/LosAngeles_SandGold_001.png?v=1650876856',
      color: Colors.grey[600],
      colorOptions: [
        Colors.grey[600],
        Colors.red,
        Colors.black,
        Colors.yellow,
        Colors.cyan
      ],
    ),*/
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
