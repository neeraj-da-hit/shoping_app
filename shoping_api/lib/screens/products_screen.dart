import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_api/controller/products_controller.dart';
import 'package:shoping_api/widgets/prodcut_card.dart';
import 'package:shoping_api/widgets/shimmer_grid.dart'; 

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products Grid',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const ShimmerGrid();
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,         
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,     
              ),
              itemBuilder: (context, index) {
                final product = controller.productList[index];
                return ProductCard(product: product);
              },
            ),
          );
        }
      }),
    );
  }
}
