import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:shaghaf/screens/main_screens/bottom_navigation_bar.dart';
import '../../helpers/const.dart';

class UserSignUpMsg extends StatefulWidget {
  const UserSignUpMsg(
      {super.key,
      required this.emailAlreadyInUse,
      required this.weakPassword,
      required this.emailInvalid,
      required this.userSignedUpSuccessfully});
  final bool emailAlreadyInUse;
  final bool weakPassword;
  final bool emailInvalid;
  final bool userSignedUpSuccessfully;
  @override
  State<UserSignUpMsg> createState() => _UserSignUpMsgState();
}

class _UserSignUpMsgState extends State<UserSignUpMsg> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const BottomNavigationBarScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return SizedBox(
        width: size.width,
        child: SimpleDialog(
          backgroundColor:
              themeListener.isDark ? backgroundColorDark : backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          children: [
            SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 50, right: 50, bottom: 15),
                  child: Image.asset(
                    widget.userSignedUpSuccessfully
                        ? "assets/icons/checked.png"
                        : "assets/icons/cancel.png",
                    width: size.width / 20,
                    height: size.height / 20,
                    fit: BoxFit.contain,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 50, left: 50, right: 50, top: 10),
              child: Center(
                  child: Text(
                widget.userSignedUpSuccessfully
                    ? AppLocalizations.of(context)!.signupsuccessmsg
                    : AppLocalizations.of(context)!.dialogresetpasswordmsg,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: themeListener.isDark
                      ? titleTextColorDark
                      : titleTextColor,
                ),
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ));
  }
}
