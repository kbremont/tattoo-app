import 'package:flutter/material.dart';
import 'package:tattooapp/src/features/home/presentation/home_screen.dart';
import 'package:tattooapp/src/features/search/presentation/search_screen.dart';
import 'package:tattooapp/src/features/user/presentation/profile_display_screen.dart';

class MainAppShell extends StatefulWidget {
  final int initialIndex;

  const MainAppShell({super.key, this.initialIndex = 0});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(),
      SearchScreen(),
      ProfileDisplayScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
