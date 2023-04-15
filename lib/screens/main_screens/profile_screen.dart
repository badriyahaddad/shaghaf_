import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/screens/sub_screens/settings_screen.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/static_widget/artworks_homescreen_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
import '../../widgets/static_widget/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 70,
              ),
              CostuomAppBar(
                isDetails: false,
                iconData: const Icon(Icons.settings),
                isOtherScreens: false,
                isHome: true,
                profileName: '',
                title: AppLocalizations.of(context)!.profilescreenappbartitle,
                subTitle: '',
                iconBehavior: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SettingScreen()));
                },
              ),
              SizedBox(
                height: size.width / 1.3,
                width: size.width,
                child: const ProfileCard(
                  artWorkImage: "assets/person3.png",
                  artistName: "إيمان الورفلي",
                  workCatagory: "رسامة",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  AppLocalizations.of(context)!.profiletitle,
                  style: TextStyle(
                      color: themeListener.isDark
                          ? titleTextColorDark
                          : titleTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const ArtWorkCard(
                hide: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
