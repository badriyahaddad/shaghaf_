import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:shaghaf/screens/sub_screens/add_form_artwork_screen.dart';
import 'package:shaghaf/widgets/static_widget/settings_card.dart';
import '../../providers/auth_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
import '../auth_screen/get_started_screen.dart';
import 'edit_account_data_screen.dart';
import 'views_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 70,
          ),
          CostuomAppBar(
            menueFunction: () {},
            isDetails: false,
            isHome: false,
            profileName: '',
            title: AppLocalizations.of(context)!.settings,
            isOtherScreens: false,
            iconBehavior: () {
              Navigator.pop(context);
            },
            iconData: const Icon(Icons.arrow_back),
            subTitle: '',
          ),
          SizedBox(
            height: size.height / 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              AppLocalizations.of(context)!.options,
              style: TextStyle(
                  color: themeListener.isDark
                      ? titleTextColorDark
                      : titleTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const AddFormArtworkScreen()));
              },
              child: SettingsCard(
                icon: const Icon(Icons.dashboard_rounded),
                nextIcon: const Icon(Icons.navigate_next_rounded),
                title: AppLocalizations.of(context)!.dashbord,
                isLogOutCard: false,
                iconBehavior: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (_) => const AddFormArtworkScreen()));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const EditAccountDataScreen()));
              },
              child: SettingsCard(
                icon: const Icon(Icons.edit_square),
                nextIcon: const Icon(Icons.navigate_next_rounded),
                title: AppLocalizations.of(context)!.editaccountdata,
                isLogOutCard: false,
                iconBehavior: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (_) => const EditAccountDataScreen()));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ViewsScreen()));
              },
              child: SettingsCard(
                icon: const Icon(Icons.filter_vintage_outlined),
                nextIcon: const Icon(Icons.navigate_next_rounded),
                title: AppLocalizations.of(context)!.views,
                isLogOutCard: false,
                iconBehavior: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (_) => const ViewsScreen()));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: GestureDetector(
              onTap: () {
                authProvider.logOut();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const GetStartedScreen()));
              },
              child: SettingsCard(
                icon: const Icon(Icons.logout_rounded),
                nextIcon: const Icon(Icons.navigate_next_rounded),
                title: AppLocalizations.of(context)!.logout,
                isLogOutCard: true,
                iconBehavior: () {},
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
