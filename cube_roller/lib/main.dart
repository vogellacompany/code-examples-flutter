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
    String s = build5("Lars");
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
              label: s,
            ),
            NavigationDestination(
              icon: Badge(
                child: Icon(Icons.notifications_sharp),
              ),
              label: 'Notifications',
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
          child: Text('Hello World!'),
        ),
      ),
    );
  }

  void updateSelectedTab(int newValueForselectedTab) {
    setState(() {
      selectedTab = newValueForselectedTab;
    });
  }

  int build3() {
    return 1;
  }

  String build4() {
    return "Hallo Welt mein Name ist Kiran";
  }

  String build5(String meinString) {
    // Lars Länge 4
    String neu = "";
    for (int i = meinString.length; i > 0; i--) {
      int wert = i - 1;
      neu = neu + meinString[wert];
    }
    return neu;
  }
}


// NavigationBar(
//           destinatikiranons: [
//             NavigationDestination(
//               icon: Icon(Icons.home),
//               label: "Home",
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.access_alarm),
//               label: "Help",
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.select_all),
//               label: "Help",
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.travel_explore),
//               label: "Help",
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.add_box_rounded),
//               label: "Help",
//             ),
//           ],
//           onDestinationSelected: (value) => {value},
//         ),