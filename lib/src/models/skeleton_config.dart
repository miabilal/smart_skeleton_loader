import 'package:flutter/material.dart';

class SkeletonConfig {
  final Color shimmerColor;
  final Color highlightColor;
  final Color backgroundColor;
  final int numberOfItems;
  final Duration timeoutDuration;
  final Widget? errorWidget;
  final double shimmerSpeed;

  const SkeletonConfig({
    this.shimmerColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.numberOfItems = 3,
    this.timeoutDuration = const Duration(seconds: 30),
    this.errorWidget,
    this.shimmerSpeed = 1.0,
  });

  SkeletonConfig copyWith({
    Color? shimmerColor,
    Color? highlightColor,
    Color? backgroundColor,
    int? numberOfItems,
    Duration? timeoutDuration,
    Widget? errorWidget,
    double? shimmerSpeed,
  }) {
    return SkeletonConfig(
      shimmerColor: shimmerColor ?? this.shimmerColor,
      highlightColor: highlightColor ?? this.highlightColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      numberOfItems: numberOfItems ?? this.numberOfItems,
      timeoutDuration: timeoutDuration ?? this.timeoutDuration,
      errorWidget: errorWidget ?? this.errorWidget,
      shimmerSpeed: shimmerSpeed ?? this.shimmerSpeed,
    );
  }
}
