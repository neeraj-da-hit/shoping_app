import 'package:flutter/material.dart';
import 'package:shoping_api/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 320,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
'',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              background: Hero(
                tag: product.id,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green.shade50, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Tag
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      product.category.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Title
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Rating Row
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        if (index < product.rating.rate.floor()) {
                          return const Icon(Icons.star, color: Colors.amber, size: 22);
                        } else if (index < product.rating.rate) {
                          return const Icon(Icons.star_half, color: Colors.amber, size: 22);
                        } else {
                          return const Icon(Icons.star_border, color: Colors.amber, size: 22);
                        }
                      }),
                      const SizedBox(width: 8),
                      Text(
                        '(${product.rating.count} reviews)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Price
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.green.shade700,
                      letterSpacing: 1.1,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description Section
                  Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Add to Cart Button with gradient & shadow
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added to cart")),
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                        elevation: MaterialStateProperty.all(6),
                        shadowColor: MaterialStateProperty.all(Colors.greenAccent.shade400),
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => Colors.transparent,
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF56AB2F), Color(0xFFA8E063)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.shade300.withOpacity(0.6),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
