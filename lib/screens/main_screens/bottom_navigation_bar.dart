import 'package:flutter/material.dart';
import 'package:shaghaf/screens/main_screens/products_screen.dart';
import 'package:shaghaf/screens/main_screens/profile_screen.dart';
import 'package:shaghaf/screens/main_screens/services_screen.dart';
import '../../helpers/const.dart';
import 'home_screen.dart';

class BottomTabsNaviScreen extends StatefulWidget {
  const BottomTabsNaviScreen({super.key});

  @override
  State<BottomTabsNaviScreen> createState() => _BottomTabsNaviScreenState();
}

class _BottomTabsNaviScreenState extends State<BottomTabsNaviScreen> {
  int currentIndex = 0;
  void updateIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Container createBottombar(BuildContext context) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (updateIndex),
            backgroundColor: secondrayColor.withOpacity(0.5),
            elevation: 0,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                label: "",
                icon: Image.asset(
                  currentIndex == 0
                      ? "assets/icons/selected_home.png"
                      : "assets/icons/home.png",
                  width: size.width / 15,
                  height: size.width / 15,
                  color: currentIndex == 0
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Image.asset(
                  currentIndex == 1
                      ? "assets/icons/selected_products.png"
                      : "assets/icons/products.png",
                  width: size.width / 15,
                  height: size.width / 15,
                  color: currentIndex == 1
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Image.asset(
                  currentIndex == 2
                      ? "assets/icons/selected_services.png"
                      : "assets/icons/services.png",
                  width: size.width / 12,
                  height: size.width / 12,
                  color: currentIndex == 2
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Image.asset(
                  currentIndex == 3
                      ? "assets/icons/selected_profile.png"
                      : "assets/icons/profile.png",
                  width: size.width / 15,
                  height: size.width / 15,
                  color: currentIndex == 3
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        body: currentIndex == 0
            ? const HomeScreen()
            : currentIndex == 1
                ? const ProductScreen()
                : currentIndex == 2
                    ? const ServicesScreen()
                    : const ProfileScreen(),
        bottomNavigationBar: createBottombar(context));
  }
}
