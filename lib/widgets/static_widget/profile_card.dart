import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import '../../providers/theme_provider.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard(
      {super.key,
      required this.artistName,
      required this.artWorkImage,
      required this.workCatagory});
  final String artistName;
  final String artWorkImage;
  final String workCatagory;
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          top: 100,
          child: Container(
            height: size.height / 4.5,
            width: size.width / 1.2,
            decoration: BoxDecoration(
                color: themeListener.isDark ? cardColorDark : cardColor,
                border: Border.all(
                    color: themeListener.isDark ? borderColorDark : borderColor,
                    width: 0.3),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
        Positioned(
          top: 60,
          child: CircleAvatar(
            maxRadius: 50,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              widget.artWorkImage,
              fit: BoxFit.cover,
              width: size.width / 1,
            ),
          ),
        ),
        Positioned(
          top: 170,
          child: Column(
            children: [
              Text(
                widget.artistName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: themeListener.isDark
                      ? titleTextColorDark
                      : titleTextColor,
                ),
              ),
              Text(
                widget.workCatagory,
                style: TextStyle(
                  fontSize: 20,
                  color:
                      themeListener.isDark ? subTitleColorDark : subTitleColor,
                ),
              ),
              SizedBox(
                height: size.height / 300,
              ),
              Icon(
                Icons.facebook,
                color: themeListener.isDark ? subTitleColorDark : subTitleColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
