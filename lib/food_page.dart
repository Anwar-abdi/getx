import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_page.dart';
import 'food_controller.dart';
import 'food_details_page.dart';
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController productController = Get.put(FoodController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent, // Custom background color
        elevation: 4.0,
        actions: [
          Obx(() {
            final cartCount = productController.cart.length;
            return Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, size: 28),
                  onPressed: () => Get.to(() => CartPage()),
                ),
                if (cartCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
      body: Obx(() {
        if (productController.products.isEmpty) {
          return const Center(
            child: Text(
              'No products available.',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];

            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),
                title: Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "\$${product.price.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.green),
                ),
                trailing: Obx(() {
                  final isInCart = productController.isInCart(product);
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: isInCart ? Colors.red : Colors.deepOrangeAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      isInCart
                          ? productController.removeFromCart(product)
                          : productController.addToCart(product);
                    },
                    child: Text(isInCart ? "Remove" : "Add to Cart"),
                  );
                }),
                onTap: () {
                  Get.to(() => ProductDetailsPage(product: product));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
