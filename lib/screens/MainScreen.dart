import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instapound/screens/ExploreScreen.dart';
import 'package:instapound/screens/HomeScreen.dart';
import 'package:instapound/screens/NotificationsScreen.dart';
import 'package:instapound/screens/ProfileScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPageIndex = 0;
  final screens = [];

  Widget getHomeScreen(BuildContext context) {
    return const HomeScreen();
  }

  Widget getExploreScreen(BuildContext context) {
    return const ExploreScreen();
  }

  Widget getNotificationsScreen(BuildContext context) {
    return const NotificationsScreen();
  }

  Widget getProfileScreen(BuildContext context) {
    return const ProfileScreen();
  }

  @override
  void initState() {
    screens.add(getHomeScreen);
    screens.add(getExploreScreen);
    screens.add(getExploreScreen);
    screens.add(getNotificationsScreen);
    screens.add(getProfileScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPageIndex](context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        backgroundColor: Colors.black87,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.background,
        unselectedItemColor:
            Theme.of(context).colorScheme.background.withAlpha(100),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() => selectedPageIndex = index);
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: selectedPageIndex == 2
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context)
                            .colorScheme
                            .background
                            .withAlpha(100),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(CupertinoIcons.add),
            ),
            label: "Add",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            activeIcon: Icon(CupertinoIcons.heart_fill),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedPageIndex == 4
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.background.withAlpha(100),
                  width: 2,
                ),
                image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/200/200"),
                ),
                shape: BoxShape.circle,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
