import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:shaghaf/screens/auth_screen/log_in.dart';

import '../../helpers/const.dart';

class PasswordRestedDialog extends StatefulWidget {
  const PasswordRestedDialog({super.key});

  @override
  State<PasswordRestedDialog> createState() => _PasswordRestedDialogState();
}

class _PasswordRestedDialogState extends State<PasswordRestedDialog> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 400), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return SimpleDialog(
      backgroundColor:
          themeListener.isDark ? backgroundColorDark : backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      children: [
        SizedBox(
            width: size.width,
            height: size.height / 4,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 50, right: 50, bottom: 15),
              child: Image.asset(
                themeListener.isDark
                    ? "assets/dialog_resetpassword_dark.png"
                    : "assets/dialog_resetpassword.png",
                fit: BoxFit.contain,
              ),
            )),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 50, left: 50, right: 50, top: 10),
          child: Center(
              child: Text(
            AppLocalizations.of(context)!.dialogresetpasswordmsg,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: themeListener.isDark ? titleTextColorDark : titleTextColor,
            ),
          )),
        ),
      ],
    );
  }
}
