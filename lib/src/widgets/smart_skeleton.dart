import 'dart:async';
import 'package:flutter/material.dart';
import '../models/skeleton_config.dart';
import '../utils/network_utils.dart';
import '../utils/theme_utils.dart';

class SmartSkeleton extends StatefulWidget {
  final Widget child;
  final SkeletonConfig config;
  final Future<void> Function()? onLoad;
  final Widget Function(BuildContext)? errorBuilder;

  const SmartSkeleton({
    Key? key,
    required this.child,
    this.config = const SkeletonConfig(),
    this.onLoad,
    this.errorBuilder,
  }) : super(key: key);

  @override
  State<SmartSkeleton> createState() => _SmartSkeletonState();
}

class _SmartSkeletonState extends State<SmartSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isLoading = true;
  bool _hasError = false;
  double _shimmerSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );

    _initialize();
  }

  Future<void> _initialize() async {
    NetworkUtils().networkSpeedStream.listen((speed) {
      setState(() => _shimmerSpeed = speed);
      _controller.duration = Duration(milliseconds: (1500 / speed).round());
    });

    if (widget.onLoad != null) {
      try {
        await Future.any([
          widget.onLoad!(),
          Future.delayed(widget.config.timeoutDuration).then((_) {
            throw TimeoutException('Loading timed out');
          }),
        ]);
        if (mounted) {
          setState(() => _isLoading = false);
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _hasError = true;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return widget.errorBuilder?.call(context) ??
          widget.config.errorWidget ??
          const Center(child: Text('Error loading content'));
    }

    if (!_isLoading) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment(_animation.value - 1, 0),
              end: Alignment(_animation.value, 0),
              colors: [
                ThemeUtils.getShimmerColor(context, widget.config.shimmerColor),
                ThemeUtils.getHighlightColor(
                    context, widget.config.highlightColor),
                ThemeUtils.getShimmerColor(context, widget.config.shimmerColor),
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: Container(
        color: ThemeUtils.getBackgroundColor(
            context, widget.config.backgroundColor),
        child: widget.child,
      ),
    );
  }
}
