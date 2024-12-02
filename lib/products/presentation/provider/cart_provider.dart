import 'package:flutter/material.dart';
import 'package:products/products/domain/entities/products_entity.dart';

class CartProvider with ChangeNotifier {
  final List<IndividualProductEntity> _cartItmes = [];

  List<IndividualProductEntity> get cartItems => _cartItmes;

  void addToCart(IndividualProductEntity product) {
    _cartItmes.add(product);
    notifyListeners();
  }

  void removeFromCart(IndividualProductEntity product) {
    _cartItmes.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItmes.clear();
    notifyListeners();
  }
}
