import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/auth_provider.dart';

import '../../helpers/const.dart';
import '../../providers/filter_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/dialogs/user_sign_up_dialog_msg.dart';
import '../../widgets/input_widget/drop_down_menu_user.dart';

class SelectUserCatagoryScreen extends StatefulWidget {
  const SelectUserCatagoryScreen(
      {super.key,
      required this.email,
      required this.password,
      required this.name,
      required this.userImg});
  final String email;
  final String password;
  final String name;
  final String userImg;
  @override
  State<SelectUserCatagoryScreen> createState() =>
      _SelectUserCatagoryScreenState();
}

class _SelectUserCatagoryScreenState extends State<SelectUserCatagoryScreen> {
  @override
  void initState() {
    Provider.of<FilterProvider>(context, listen: false)
        .loadFilterFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final filterListener = Provider.of<FilterProvider>(context, listen: false);
    final authListener = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: size.height / 3.5,
              ),
              Text(
                //title
                AppLocalizations.of(context)!.catagoryselect,
                style: TextStyle(
                    color: themeListener.isDark
                        ? titleTextColorDark
                        : titleTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              DropDownMenueUserWidget(
                items: filterListener.items,
              ),
              SizedBox(
                height: size.height / 2.5,
              ),
              Button(
                borderButton: false,
                color: themeListener.isDark ? mainColorDark : mainColor,
                loading: false,
                onClick: () {
                  authListener
                      .signUp(
                        widget.email,
                        widget.name,
                        widget.password,
                        AppLocalizations.of(context)!.localeName == "ar"
                            ? filterListener.selectedUser!.catagoryAr
                            : filterListener.selectedUser!.catagoryEn,
                        widget.userImg,
                      )
                      .then((value) => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const UserSignUpMsg(
                              emailAlreadyInUse: false,
                              userSignedUpSuccessfully: true,
                              emailInvalid: false,
                              weakPassword: true,
                            );
                          }));
                },
                screenHieght: size.height / 16,
                screenWidth: size.width / 1.1,
                txt: AppLocalizations.of(context)!.signupbutton,
                isActive: true,
              ),
            ]),
          ),
        )),
      ),
    );
  }
}
