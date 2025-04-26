import 'package:flutter/material.dart';
import 'package:smart_skeleton_loader/smart_skeleton_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Skeleton Loader Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Skeleton Loader'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              final brightness = Theme.of(context).brightness;
              final newTheme = brightness == Brightness.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
              // In a real app, you would use a theme provider here
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildListViewExample(),
          _buildGridViewExample(),
          _buildProfileExample(),
          _buildDashboardExample(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view),
            label: 'Grid',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }

  Widget _buildListViewExample() {
    return ListViewSkeleton(
      onLoad: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      config: SkeletonConfig(
        numberOfItems: 10,
        timeoutDuration: const Duration(seconds: 30),
      ),
    );
  }

  Widget _buildGridViewExample() {
    return GridViewSkeleton(
      crossAxisCount: 2,
      itemHeight: 200,
      onLoad: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
    );
  }

  Widget _buildProfileExample() {
    return ProfileViewSkeleton(
      avatarSize: 120,
      onLoad: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
    );
  }

  Widget _buildDashboardExample() {
    return DashboardViewSkeleton(
      onLoad: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
    );
  }
}
