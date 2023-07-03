import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/screens/auth_screen/select_user_catagory_screen.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/input_widget/user_image_card.dart';

class UserPickImageScreen extends StatefulWidget {
  const UserPickImageScreen(
      {super.key,
      required this.email,
      required this.password,
      required this.name});
  final String email;
  final String password;
  final String name;
  @override
  State<UserPickImageScreen> createState() => _UserPickImageScreenState();
}

class _UserPickImageScreenState extends State<UserPickImageScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    //  final userListener = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Center(
            child: UserImageCard(
              onFileChanged: (imageUrl) {
                setState(() {
                  imageUrl = imageUrl;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Button(
              borderButton: false,
              color: themeListener.isDark ? mainColorDark : mainColor,
              loading: false,
              onClick: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => SelectUserCatagoryScreen(
                          email: widget.email,
                          name: widget.name,
                          password: widget.password,
                          userImg: imageUserUrl,
                        )));
              },
              screenHieght: size.height / 16,
              screenWidth: size.width / 1.1,
              txt: AppLocalizations.of(context)!.nextbutton,
              isActive: true,
            ),
          ),
        ],
      )),
    );
  }
}
