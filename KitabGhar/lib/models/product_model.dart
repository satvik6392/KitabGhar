import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  const Product({
    required this.category,
    required this.imageUrl,
    required this.isPopular,
    required this.isRecommended,
    required this.name,
    required this.price,
  });

  @override
  List<Object?> get props => [name, category, imageUrl, price, isRecommended, isPopular];

 
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        isPopular: snap['isPopular'],
        isRecommended: snap['isRecommended'],
        name: snap['name'],
        price: snap['price'].toDouble());
    return product;
  }

  static List<Product> products = [
    const Product(
        category: 'Business',
        imageUrl:
            'https://m.media-amazon.com/images/I/71tUrymD+2L._AC_UF1000,1000_QL80_.jpg',
        isPopular: true,
        isRecommended: true,
        name: "Build don't Talk",
        price: 150),
    const Product(
        category: 'Education',
        imageUrl:
            'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71+ErgSDkrL.jpg',
        isPopular: false,
        isRecommended: true,
        name: "Outliers",
        price: 200),
    const Product(
        category: 'Comic',
        imageUrl:
            'https://kbimages1-a.akamaihd.net/18b74e17-87ea-4cff-b4d5-dc2ccfdd64ab/1200/1200/False/superhero-comics-1.jpg',
        isPopular: true,
        isRecommended: true,
        name: "Superhero Comics",
        price: 150),
    const Product(
        category: 'Novel',
        imageUrl:
            'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/813uPMOnskL.jpg',
        isPopular: false,
        isRecommended: true,
        name: "You Can",
        price: 150),
    const Product(
        category: 'Syllabus',
        imageUrl:
            'https://lh3.googleusercontent.com/--Oum_xRqw1Y/YMjB-OGao8I/AAAAAAAAQjM/LvjuMWPBsY8ZHDkRssyELF5u0dD_8wKGACLcBGAsYHQ/s1600/1623769580999157-0.png',
        isPopular: true,
        isRecommended: true,
        name: "Hindi Kalrav",
        price: 150),
  ];
}
