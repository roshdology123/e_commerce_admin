import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object> get props => [
        id,
        name,
        category,
        description,
        imageUrl,
        isRecommended,
        isPopular,
        price,
        quantity
      ];

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        isRecommended: isRecommended ?? this.isRecommended,
        isPopular: isPopular ?? this.isPopular);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "name": name,
      'category': category,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    return Product(
        id: snapshot['id'],
        name: snapshot['name'],
        category: snapshot['category'],
        description: snapshot['description'],
        imageUrl: snapshot['imageUrl'],
        price: snapshot['price'],
        quantity: snapshot['quantity'],
        isRecommended: snapshot['isRecommended'],
        isPopular: snapshot['isPopular']);
  }

  String toJson() => json.encode(toMap());


  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
      id: 1,
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      description:
          'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, ',
      imageUrl:
          'https://images.unsplash.com/photo-1567103472667-6898f3a79cf2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      isPopular: false,
      isRecommended: true,
      price: 2.99,
    ),
    Product(
      id: 2,
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      description:
          'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, ',
      imageUrl:
          'https://images.unsplash.com/photo-1581006852262-e4307cf6283a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      isPopular: true,
      isRecommended: true,
      price: 3.99,
    ),
    Product(
      id: 3,
        name: 'Soft Drink #3',
        category: 'Soft Drinks',
        description:
            'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, ',
        imageUrl:
            'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        isPopular: false,
        isRecommended: true,
        price: 1.99),
    Product(
      id: 4,
        name: 'Soft Drink #4',
        category: 'Soft Drinks',
        description:
            'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, ',
        imageUrl:
            'https://images.unsplash.com/photo-1603394630850-69b3ca8121ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        isPopular: true,
        isRecommended: false,
        price: 4.99),
    Product(
      id: 5,
        name: 'Smoothies #1',
        category: 'Smoothies',
        description:
            'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, ',
        imageUrl:
            'https://images.unsplash.com/photo-1638176311291-36b0eacc6b08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        isPopular: true,
        isRecommended: false,
        price: 4.99),
    Product(
      id: 6,
        name: 'Smoothies #2',
        category: 'Smoothies',
        description:
            'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, ',
        imageUrl:
            'https://images.unsplash.com/photo-1604298331663-de303fbc7059?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        isPopular: false,
        isRecommended: true,
        price: 4.99),
  ];
}
