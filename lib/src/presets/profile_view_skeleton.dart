import 'package:flutter/material.dart';
import '../widgets/smart_skeleton.dart';
import '../models/skeleton_config.dart';

class ProfileViewSkeleton extends StatelessWidget {
  final SkeletonConfig config;
  final double avatarSize;
  final EdgeInsets padding;
  final Future<void> Function()? onLoad;
  final Widget Function(BuildContext)? errorBuilder;

  const ProfileViewSkeleton({
    Key? key,
    this.config = const SkeletonConfig(),
    this.avatarSize = 120.0,
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
      child: SingleChildScrollView(
        padding: padding,
        child: Column(
          children: [
            _buildAvatarSection(context),
            const SizedBox(height: 24.0),
            _buildInfoSection(context),
            const SizedBox(height: 24.0),
            _buildStatsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(BuildContext context) {
    return Column(
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[200]
                : Colors.grey[700],
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          width: 200.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[200]
                : Colors.grey[700],
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[200]
                      : Colors.grey[700],
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Container(
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[200]
                        : Colors.grey[700],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        3,
        (index) => Column(
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[200]
                    : Colors.grey[700],
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              width: 60.0,
              height: 16.0,
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
    );
  }
}
