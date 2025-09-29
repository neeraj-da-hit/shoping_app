import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6, // Number of shimmer items
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      padding: const EdgeInsets.all(8),
      itemBuilder: (_, __) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 6),
                Container(
                  height: 12,
                  width: 60,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
