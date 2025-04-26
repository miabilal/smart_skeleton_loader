import 'package:flutter/material.dart';
import '../widgets/smart_skeleton.dart';
import '../models/skeleton_config.dart';

class ListViewSkeleton extends StatelessWidget {
  final SkeletonConfig config;
  final double itemHeight;
  final double itemSpacing;
  final EdgeInsets padding;
  final Future<void> Function()? onLoad;
  final Widget Function(BuildContext)? errorBuilder;

  const ListViewSkeleton({
    Key? key,
    this.config = const SkeletonConfig(),
    this.itemHeight = 80.0,
    this.itemSpacing = 8.0,
    this.padding = const EdgeInsets.all(16.0),
    this.onLoad,
    this.errorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartSkeleton(
      config: config,
      onLoad: onLoad,
      errorBuilder: errorBuilder,
      child: ListView.separated(
        padding: padding,
        itemCount: config.numberOfItems,
        separatorBuilder: (context, index) => SizedBox(height: itemSpacing),
        itemBuilder: (context, index) => _buildSkeletonItem(context),
      ),
    );
  }

  Widget _buildSkeletonItem(BuildContext context) {
    return Container(
      height: itemHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.grey[800],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            width: itemHeight,
            height: itemHeight,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[200]
                  : Colors.grey[700],
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  width: 120.0,
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
