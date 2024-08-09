import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/presentation/main/main_view.dart';
import 'package:test_app/presentation/settings/view/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentValue = 0;

  final views = [
    const MainView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: views[currentValue],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 1.0,
        unselectedItemColor: theme.indicatorColor,
        selectedItemColor: theme.primaryColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: currentValue,
        onTap: (value) {
          setState(() {
            currentValue = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: "Users",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
