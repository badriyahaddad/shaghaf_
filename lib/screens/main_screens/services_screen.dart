import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/static_widget/artworks_homescreen_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
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
              iconData: Image.asset(
                themeListener.isDark
                    ? "assets/icons/cartIcon_Dark.png"
                    : "assets/icons/cartIcon.png",
                width: size.width / 5,
              ),
              isOtherScreens: false,
              isHome: true,
              profileName: '',
              title: AppLocalizations.of(context)!.servicesappbartitle,
              subTitle: '',
              iconBehavior: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                AppLocalizations.of(context)!.servicestitle,
                style: TextStyle(
                    color: themeListener.isDark
                        ? titleTextColorDark
                        : titleTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height / 150,
            ),
            const ArtWorkCard(
              hide: false,
            )
          ],
        ),
      )),
    );
  }
}
