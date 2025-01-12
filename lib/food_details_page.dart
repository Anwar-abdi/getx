import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'food_controller.dart';
import 'food_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final FoodModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final FoodController productController = Get.put(FoodController());
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250.0, // Set a fixed height for the image
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            SizedBox(height: 16.0),
            Text(
              "Price: \$${product.price}",
              style: TextStyle(fontSize: 20.0, color: Colors.green),
            ),
            SizedBox(height: 32.0), // Space before the button
            Obx(() {
              final isInCart = productController.isInCart(product);
              return ElevatedButton(
                onPressed: () {
                  isInCart
                      ? productController.removeFromCart(product)
                      : productController.addToCart(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent, // Custom background color
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isInCart ? "Remove from Cart" : "Add to Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
