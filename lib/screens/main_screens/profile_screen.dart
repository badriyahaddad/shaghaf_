import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/auth_provider.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/static_widget/artworks_homescreen_card.dart';
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
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).loadUsersFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return SafeArea(
      child: Consumer<AuthProvider>(builder: (context, userConsumer, child) {
        return SingleChildScrollView(
          child: ListView.builder(
              itemCount: userConsumer.users.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.width / 1.3,
                      width: size.width,
                      child: ProfileCard(
                        artWorkImage: userConsumer.users[index].image!,
                        artistName: userConsumer.users[index].name!,
                        workCatagory: userConsumer.users[index].catagory!,
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
                );
              }),
        );
      }),
    );
  }
}
