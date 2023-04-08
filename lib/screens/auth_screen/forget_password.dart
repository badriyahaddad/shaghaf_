import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/screens/auth_screen/otp_screen.dart';

import '../../helpers/const.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/input_widget/text_field.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height / 15),
            Center(child: Image.asset("assets/otp.png")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //vertical space
                  SizedBox(height: size.height / 8),
                  Text(
                    AppLocalizations.of(context)!.forgetpasswordtitle,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context)!.forgetpasswordsubtitle,
                    style:
                        const TextStyle(fontSize: 20, color: Color(0xff949494)),
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
                prefix: Image.asset("assets/icons/emailIcon.png"),
              ),
            ),
            //vertical space
            SizedBox(height: size.height / 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Button(
                color: mainColor,
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
