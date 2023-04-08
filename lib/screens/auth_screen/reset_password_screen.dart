import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/const.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/dialogs/password_reseted_dialog.dart';
import '../../widgets/input_widget/text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // controllers of the textfields
  final passwordController = TextEditingController();

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
                    AppLocalizations.of(context)!.resetpasswordtitle,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context)!.resetpasswordsubtitle,
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
                prefix: Image.asset("assets/icons/passwordIcon.png"),
                textFieldController: passwordController,
                node: TextInputAction.done,
                isVisable: false,
                hintTxt:
                    AppLocalizations.of(context)!.resetpasswordtextfiledone,
                keyboardType: TextInputType.visiblePassword,
                validtion: (value) {
                  RegExp regExp = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.validtionemptypassword;
                  }
                  if (!regExp.hasMatch(value)) {
                    return AppLocalizations.of(context)!
                        .validtioninvalidpassword;
                  }
                  return null;
                },
                obscureText: true,
              ),
            ),
            //vertical space
            SizedBox(height: size.height / 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFieldWidget(
                isPassword: false,
                prefix: Image.asset("assets/icons/passwordIcon.png"),
                textFieldController: passwordController,
                node: TextInputAction.done,
                isVisable: false,
                hintTxt: AppLocalizations.of(context)!.resetpasswordtextfiletwo,
                keyboardType: TextInputType.visiblePassword,
                validtion: (value) {
                  RegExp regExp = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.validtionemptypassword;
                  }
                  if (!regExp.hasMatch(value)) {
                    return AppLocalizations.of(context)!
                        .validtioninvalidpassword;
                  }
                  return null;
                },
                obscureText: true,
              ),
            ),
            //vertical space
            SizedBox(height: size.height / 5.6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Button(
                color: mainColor,
                isActive: true,
                borderButton: false,
                loading: false,
                onClick: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const PasswordRestedDialog();
                      });
                },
                screenHieght: size.height / 15,
                screenWidth: size.width / 1.1,
                txt: AppLocalizations.of(context)!.resetpasswordbutton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
