import 'package:cube_roller/cube.dart';
import 'package:cube_roller/othercube.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedTab = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.amber,
          selectedIndex: selectedTab,
          onDestinationSelected: (value) => updateSelectedTab(value),
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: "Lars Cube",
            ),
            NavigationDestination(
              icon: Badge(
                child: Icon(Icons.notifications_sharp),
              ),
              label: 'Kirans Cube',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(Icons.messenger_sharp),
              ),
              label: 'Messages',
            ),
          ],
        ),
        body: Center(
          child: getWidget(selectedTab),
        ),
      ),
    );
  }

  void updateSelectedTab(int newValueForselectedTab) {
    setState(() {
      selectedTab = newValueForselectedTab;
    });
  }

  Widget getWidget(selectedTab) {
    switch (selectedTab) {
      case 0:
        return MyCube();
      case 1:
        return CreateApp();
      default:
        return Text("TODO");
    }
  }
}
