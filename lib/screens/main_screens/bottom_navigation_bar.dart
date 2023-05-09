import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/auth_provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:shaghaf/screens/main_screens/products_screen.dart';
import 'package:shaghaf/screens/main_screens/profile_screen.dart';
import 'package:shaghaf/screens/main_screens/services_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
import '../../widgets/static_widget/coustom_drawer_widget.dart';
import '../sub_screens/cart_screen.dart';
import '../sub_screens/history_booking_screen.dart';
import '../sub_screens/settings_screen.dart';
import 'home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  int currentIndex = 0;
  void updateIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  PageController pageController = PageController(initialPage: 0);
  List cart = [];
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final userListener = Provider.of<AuthProvider>(context, listen: false);
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
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                label: "",
                icon: Center(
                  child: Image.asset(
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
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Center(
                  child: Image.asset(
                    currentIndex == 1
                        ? "assets/icons/selected_products.png"
                        : "assets/icons/products.png",
                    width: size.width / 15,
                    height: size.width / 15,
                    color: currentIndex == 1
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Center(
                  child: Image.asset(
                    currentIndex == 2
                        ? "assets/icons/selected_services.png"
                        : "assets/icons/services.png",
                    width: size.width / 12,
                    height: size.width / 12,
                    color: currentIndex == 2
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Center(
                  child: Image.asset(
                    currentIndex == 3
                        ? "assets/icons/selected_profile.png"
                        : "assets/icons/profile.png",
                    width: size.width / 15,
                    height: size.width / 15,
                    color: currentIndex == 3
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              currentIndex == 0 ? size.height / 1 : size.height / 9.4,
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 70,
                    ),
                    ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CostuomAppBar(
                            menueFunction: () {
                              setState(() {
                                openDrawer();
                              });
                            },
                            iconBehavior: () {
                              currentIndex == 1
                                  ? Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => const CartScreen()))
                                  : currentIndex == 2
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const HistoryBookingScreen()))
                                      : currentIndex == 3
                                          ? Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const SettingScreen()))
                                          : Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const ProfileScreen()));
                            },
                            iconData: currentIndex == 0
                                ? const Icon(Icons.abc_outlined)
                                : currentIndex == 1
                                    ? Image.asset(
                                        themeListener.isDark
                                            ? "assets/icons/cartIcon_Dark.png"
                                            : "assets/icons/cartIcon.png",
                                        width: size.width / 5,
                                      )
                                    : currentIndex == 2
                                        ? Icon(
                                            Icons.history,
                                            color: themeListener.isDark
                                                ? Colors.white
                                                : Colors.black,
                                          )
                                        : const Icon(Icons.settings),
                            isOtherScreens: currentIndex == 0 ? true : false,
                            profileName: userListener.users[index].name!,
                            isHome: true,
                            title: currentIndex == 0
                                ? AppLocalizations.of(context)!
                                    .homescreenappbartitle
                                : currentIndex == 1
                                    ? AppLocalizations.of(context)!
                                        .productscreenappbartitle
                                    : currentIndex == 2
                                        ? AppLocalizations.of(context)!
                                            .servicesappbartitle
                                        : AppLocalizations.of(context)!
                                            .profilescreenappbartitle,
                            isDetails: false,
                            subTitle: '',
                          );
                        }),
                  ],
                ),
              ),
            )),
        key: scaffoldKey,
        drawer: CoustomDrawer(
          scaffoldKey: scaffoldKey,
        ),
        body: SafeArea(
          child: currentIndex == 0
              ? const HomeScreen()
              : currentIndex == 1
                  ? const ProductScreen()
                  : currentIndex == 2
                      ? const ServicesScreen()
                      : const ProfileScreen(),
        ),
        bottomNavigationBar: createBottombar(context));
  }
}
