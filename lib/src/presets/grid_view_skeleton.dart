import 'package:flutter/material.dart';
import '../widgets/smart_skeleton.dart';
import '../models/skeleton_config.dart';

class GridViewSkeleton extends StatelessWidget {
  final SkeletonConfig config;
  final double itemHeight;
  final double itemSpacing;
  final EdgeInsets padding;
  final int crossAxisCount;
  final Future<void> Function()? onLoad;
  final Widget Function(BuildContext)? errorBuilder;

  const GridViewSkeleton({
    Key? key,
    this.config = const SkeletonConfig(),
    this.itemHeight = 200.0,
    this.itemSpacing = 8.0,
    this.padding = const EdgeInsets.all(16.0),
    this.crossAxisCount = 2,
    this.onLoad,
    this.errorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartSkeleton(
      config: config,
      onLoad: onLoad,
      errorBuilder: errorBuilder,
      child: GridView.builder(
        padding: padding,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: itemSpacing,
          crossAxisSpacing: itemSpacing,
          childAspectRatio: 1.0,
        ),
        itemCount: config.numberOfItems,
        itemBuilder: (context, index) => _buildSkeletonItem(context),
      ),
    );
  }

  Widget _buildSkeletonItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.grey[800],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: itemHeight * 0.6,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[200]
                  : Colors.grey[700],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.0,
                  margin: const EdgeInsets.only(right: 48.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[200]
                        : Colors.grey[700],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  width: 80.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[200]
                        : Colors.grey[700],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
