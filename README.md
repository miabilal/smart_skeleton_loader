

# Smart Skeleton Loader

A Flutter package that provides customizable and adaptive skeleton loaders (shimmer placeholders) with intelligent network speed adaptation, theme support, and multiple preset layouts.

## Features

- 🎨 Multiple preset layouts (ListView, GridView, ProfileView, DashboardView)
- 🌐 Intelligent network speed adaptation
- 🌓 Automatic theme adaptation (light/dark mode)
- ⚡ Dynamic shimmer animation speed
- ⏱️ Configurable timeout duration
- ❌ Custom error widget support
- 🎯 Highly customizable appearance
- 📱 Responsive and adaptive layouts

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  smart_skeleton_loader: ^0.0.1
```

## Usage

### Basic ListView Skeleton

```dart
import 'package:smart_skeleton_loader/smart_skeleton_loader.dart';

ListViewSkeleton(
  onLoad: () async {
    // Your data fetching logic here
    await Future.delayed(const Duration(seconds: 2));
  },
  config: SkeletonConfig(
    numberOfItems: 5,
    timeoutDuration: Duration(seconds: 30),
  ),
)
```

### GridView Skeleton

```dart
GridViewSkeleton(
  crossAxisCount: 2,
  itemHeight: 200,
  onLoad: () async {
    // Your data fetching logic here
  },
)
```

### Profile View Skeleton

```dart
ProfileViewSkeleton(
  avatarSize: 120,
  onLoad: () async {
    // Your profile data fetching logic here
  },
)
```

### Dashboard View Skeleton

```dart
DashboardViewSkeleton(
  onLoad: () async {
    // Your dashboard data fetching logic here
  },
)
```

### Custom Configuration

```dart
SkeletonConfig(
  shimmerColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  backgroundColor: Colors.white,
  numberOfItems: 3,
  timeoutDuration: Duration(seconds: 20),
  errorWidget: Center(
    child: Text('Failed to load data'),
  ),
  shimmerSpeed: 1.0,
)
```

### Custom Error Widget

```dart
ListViewSkeleton(
  onLoad: () async {
    // Your data fetching logic here
  },
  errorBuilder: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, size: 48, color: Colors.red),
        SizedBox(height: 16),
        Text('Failed to load data'),
      ],
    ),
  ),
)
```

## Network Speed Adaptation

The package automatically adjusts the shimmer animation speed based on the network connection type:

- WiFi/Ethernet: Fast animation (1.0x)
- Mobile Data: Medium animation (0.7x)
- No Connection: Slow animation (0.3x)

## Theme Adaptation

The skeleton loaders automatically adapt to your app's theme:

- Light Theme: Standard colors
- Dark Theme: Adjusted opacity and colors for better visibility

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
