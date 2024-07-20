import 'dart:convert';

import 'package:final_project/models/pref_Services.dart';
import 'package:final_project/models/product.dart';
import 'package:flutter/material.dart';
import '../models/order_providerr.dart';

class CartProvider extends ChangeNotifier {
  List<OrderItem>? cartItems;
  final _prefrenceKey = 'cartItems';

  bool checkItemInCart(int productId) {
    var encodedList = PrefService.preferences?.getStringList(_prefrenceKey);
    var decodedList = encodedList?.map((e) => jsonDecode(e)).toList();
    return decodedList?.any((element) => element['uId'] == productId) ?? false;
  }

  void addProductToCart(Product product, int quantity) {
    var encodedList = PrefService.preferences?.getStringList(_prefrenceKey);
    var orderItem = OrderItem();
    orderItem.uId = product.id;
    orderItem.quantity = quantity;
    orderItem.price = (quantity * (product.price ?? 0)).toDouble();
    orderItem.product = product;
    var encodedOrderItem = jsonEncode(orderItem.toJson());
    encodedList?.add(encodedOrderItem);
    // cartItems?.add(orderItem);
    PrefService.preferences?.setStringList(_prefrenceKey, encodedList ?? []);
    getCartProducts();
    checkItemInCart(product.id ?? 0);
  }

  double getTotalCartValue() {
    double totalValue = 0;
    for (var item in cartItems ?? []) {
      totalValue += (item.price ?? 0);
    }

    return totalValue;
  }

  void getCartProducts() async {
    // await Future.delayed(const Duration(seconds: 1));
    if (PrefService.preferences?.getStringList(_prefrenceKey) == null) return;

    var encodedList = PrefService.preferences
        ?.getStringList(_prefrenceKey)
        ?.map((e) => jsonDecode(e))
        .toList();

    cartItems = encodedList?.map((e) => OrderItem.fromJson(e)).toList();
    notifyListeners();
  }

  int? getItemQuantity(int productId) {
    var encodedList = PrefService.preferences?.getStringList(_prefrenceKey);

    var decodedList = encodedList?.map((e) => jsonDecode(e)).toList();

    var item = decodedList?.firstWhere((element) => element['uId'] == productId,
        orElse: () => null);
    notifyListeners();

    return (item != null) ? item['quantity'] : 1;
    // notifyListeners();
  }
}
