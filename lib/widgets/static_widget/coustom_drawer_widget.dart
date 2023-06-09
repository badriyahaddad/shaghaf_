import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';

import 'package:shaghaf/screens/sub_screens/settings_screen.dart';
import 'package:shaghaf/widgets/static_widget/settings_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/const.dart';
import '../../providers/auth_provider.dart';

import '../../screens/auth_screen/get_started_screen.dart';
import '../../screens/sub_screens/views_screen.dart';

class CoustomDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CoustomDrawer({super.key, required this.scaffoldKey});

  @override
  State<CoustomDrawer> createState() => _CoustomDrawerState();
}

class _CoustomDrawerState extends State<CoustomDrawer> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).loadUsersFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final themeFunction = Provider.of<ThemeProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final profileProvider = Provider.of<AuthProvider>(context, listen: false);
    return Drawer(
      child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: size.height / 4,
                decoration: BoxDecoration(
                    color: themeListener.isDark
                        ? secondrayColorDark.withOpacity(0.5)
                        : secondrayColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: CircleAvatar(
                              maxRadius: 50,
                              backgroundColor: Colors.transparent,
                              child: Image.network(
                                profileProvider.currentUser?.image ?? "",
                                fit: BoxFit.cover,
                                width: size.width / 1,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.photo);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(profileProvider.currentUser?.name ?? "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                profileProvider.currentUser?.catagory ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_square,
                                size: 25,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    themeFunction.switchMode();
                  },
                  child: Icon(
                      themeListener.isDark
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                      size: 33,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: SettingsCard(
              icon: const Icon(Icons.settings),
              nextIcon: const Icon(Icons.navigate_next_rounded),
              title: AppLocalizations.of(context)!.settings,
              isLogOutCard: false,
              iconBehavior: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SettingScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: SettingsCard(
              icon: const Icon(Icons.translate),
              nextIcon: const Icon(Icons.navigate_next_rounded),
              title: AppLocalizations.of(context)!.language,
              isLogOutCard: false,
              iconBehavior: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ViewsScreen()));
              },
            ),
          ),
          SizedBox(
            height: size.height / 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: SettingsCard(
              icon: const Icon(Icons.logout_rounded),
              nextIcon: const Icon(Icons.navigate_next_rounded),
              title: AppLocalizations.of(context)!.logout,
              isLogOutCard: true,
              iconBehavior: () {
                authProvider.logOut();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const GetStartedScreen()));
              },
            ),
          ),
        ],
      ))),
    );
  }
}
