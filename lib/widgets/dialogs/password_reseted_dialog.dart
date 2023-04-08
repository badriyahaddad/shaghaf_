import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/screens/auth_screen/log_in.dart';

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
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      children: [
        SizedBox(
            width: size.width,
            height: size.height / 4,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 50, right: 50, bottom: 15),
              child: Image.asset(
                "assets/dialog_resetpassword.png",
                fit: BoxFit.contain,
              ),
            )),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 50, left: 50, right: 50, top: 10),
          child: Center(
              child: Text(
            AppLocalizations.of(context)!.dialogresetpasswordmsg,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          )),
        ),
      ],
    );
  }
}
