import 'package:get/get.dart';
import 'package:getx_app/food_model.dart';
import 'package:flutter/material.dart';

class FoodController extends GetxController {
  var products = <FoodModel>[
    FoodModel(
      id: 1,
      name: "Rice and chicken ",
      description: "tastes so good",
      price: 20.99,
      imageUrl: "assets/food1.jpg",
    ),
    FoodModel(
      id: 2,
      name: "Pasta",
      description: "so delicious pasta",
      price: 18.99,
      imageUrl: "assets/food2.jpg",
    ),
    FoodModel(
      id: 3,
      name: "Eggs",
      description: "fried egg",
      price: 10.99,
      imageUrl: "assets/food3.jpg",
    ),
    FoodModel(
      id: 4,
      name: "Milk Shake",
      description: "special drink",
      price: 10.5,
      imageUrl: "assets/food4.jpg",
    ),
  ].obs;

  var cart = <FoodModel>[].obs;

  void addToCart(FoodModel product) {
    cart.add(product);
    Get.snackbar(
      "Added to Cart",
      "${product.name} has been added to your cart.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.greenAccent,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      icon: Icon(Icons.check, color: Colors.white),
      duration: Duration(seconds: 2),
    );
  }

  void removeFromCart(FoodModel product) {
    cart.remove(product);
    Get.snackbar(
      "Removed from Cart",
      "${product.name} has been removed from your cart.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      icon: Icon(Icons.remove_circle_outline, color: Colors.white),
      duration: Duration(seconds: 2),
    );
  }

  bool isInCart(FoodModel product) {
    return cart.contains(product);
  }
}
