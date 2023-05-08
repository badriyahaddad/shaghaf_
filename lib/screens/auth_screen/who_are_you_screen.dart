import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:shaghaf/providers/theme_provider.dart';
import '../../helpers/const.dart';
import '../../widgets/static_widget/who_are_you_card.dart';

// ignore: must_be_immutable
class WhoAreYouScreen extends StatefulWidget {
  WhoAreYouScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  });
  final String emailController;
  final String passwordController;
  final String nameController;
  bool isRoleBase = false;
  @override
  State<WhoAreYouScreen> createState() => _WhoAreYouScreenState();
}

class _WhoAreYouScreenState extends State<WhoAreYouScreen> {
  // bool isSelected = false;
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
              height: size.height / 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.whoareyou,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: themeListener.isDark
                            ? titleTextColorDark
                            : titleTextColor),
                  ),
                  Text(
                    AppLocalizations.of(context)!.whoareyoudiscrption,
                    style: TextStyle(
                        fontSize: 20,
                        color: themeListener.isDark
                            ? subTitleColorDark
                            : subTitleColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 6,
            ),
            Row(
              children: [
                Column(
                  children: [
                    WhoAreYouCard(
                      image: Image.asset(
                        "assets/icons/user.png",
                        width: size.width / 6,
                        height: size.height / 6,
                      ),
                      roleBase: () {},
                      tilte: AppLocalizations.of(context)!.rolebasetwo,
                      border: widget.isRoleBase
                          ? Border.all(
                              color: themeListener.isDark
                                  ? mainColorDark
                                  : mainColor,
                              width: 3,
                            )
                          : null,
                    ),
                  ],
                ),
                Column(
                  children: [
                    WhoAreYouCard(
                      image: Image.asset(
                        "assets/icons/artist.png",
                        width: size.width / 2,
                        height: size.height / 2,
                      ),
                      roleBase: () {
                        setState(() {
                          widget.isRoleBase = !widget.isRoleBase;
                        });
                      },
                      tilte: AppLocalizations.of(context)!.rolebaseone,
                      border: widget.isRoleBase
                          ? Border.all(
                              color: themeListener.isDark
                                  ? mainColorDark
                                  : mainColor,
                              width: 3,
                            )
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
