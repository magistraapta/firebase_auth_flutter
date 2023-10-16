import 'package:firebase_test/home_page.dart';
import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  _NavigationWidgetState createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return HomePage();
      case 2:
        return HomePage();

      default:
        return HomePage();
    }
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
      ),
      body: _getPage(currentIndex),
    );
  }
}
