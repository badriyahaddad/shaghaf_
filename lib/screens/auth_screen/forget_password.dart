import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/screens/auth_screen/otp_screen.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/input_widget/text_field.dart';

//What is it: Forget password screen when the user foget thier password tey can set new password
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  // controllers of the textfields
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      //this appbar allows the user to navigate back to the previous screen, through pushReplacement !
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height / 15),
            Center(
                child: Image.asset(
              themeListener.isDark ? "assets/otp_dark.png" : "assets/otp.png",
              width: size.width / 3,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //vertical space
                  SizedBox(height: size.height / 8),
                  Text(
                    //title
                    AppLocalizations.of(context)!.forgetpasswordtitle,
                    style: TextStyle(
                        color: themeListener.isDark
                            ? titleTextColorDark
                            : titleTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  //subTitle
                  Text(
                    AppLocalizations.of(context)!.forgetpasswordsubtitle,
                    style: TextStyle(
                      fontSize: 20,
                      color: themeListener.isDark
                          ? subTitleColorDark
                          : subTitleColor,
                    ),
                  ),
                ],
              ),
            ),
            //vertical space
            SizedBox(height: size.height / 30),
            //textfield email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFieldWidget(
                isPassword: false,
                textFieldController: emailController,
                node: TextInputAction.next,
                isVisable: false,
                hintTxt: AppLocalizations.of(context)!.hintemail,
                keyboardType: TextInputType.emailAddress,
                validtion: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.validtionemptyemail;
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return AppLocalizations.of(context)!.validtioninvalidemail;
                  }
                  return null;
                },
                obscureText: false,
                prefix: Image.asset(themeListener.isDark
                    ? "assets/icons/emailIcon_Dark.png"
                    : "assets/icons/emailIcon.png"),
              ),
            ),
            //vertical space
            SizedBox(height: size.height / 4),
            //button so they can navigate to another screen which is otp
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Button(
                color: themeListener.isDark ? mainColorDark : mainColor,
                isActive: true,
                borderButton: false,
                loading: false,
                onClick: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const OtpScreen()));
                },
                screenHieght: size.height / 15,
                screenWidth: size.width / 1.1,
                txt: AppLocalizations.of(context)!.nextbutton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
