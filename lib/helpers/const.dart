import 'package:flutter/material.dart';
import 'package:shaghaf/models/filter_model.dart';

//--------------------Colors---------------------------------

//******************* Light Mode ****************************
Color mainColor = const Color(0xff006E91);
Color disaabledMainColor = const Color(0xffACBDC2);
Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);
Color secondrayColor = const Color(0xff976F02);
Color cardColor = const Color(0xffF2F2F2);
Color borderColor = const Color.fromARGB(255, 202, 202, 202);
Color welcomeButtonColor = const Color(0xff191300);
Color titleTextColor = const Color(0xff0D0D0D);
Color subTitleColor = const Color(0xff8D8D8D);
Color error = const Color.fromARGB(255, 197, 6, 6);
Color success = const Color.fromARGB(255, 51, 128, 21);
//******************* Dark Mode *****************************
Color mainColorDark = const Color(0xffC99403);
Color disaabledMainColorDark = const Color.fromARGB(255, 225, 189, 92);
Color backgroundColorDark = const Color(0xff242424);
Color secondrayColorDark = const Color(0xff006E91);
Color cardColorDark = const Color(0xff4D4D4D);
Color borderColorDark = const Color.fromARGB(255, 26, 26, 26);
Color welcomeButtonColorDark = const Color(0xff1A1A1A);
Color titleTextColorDark = const Color(0xffFFFFFF);
Color subTitleColorDark = const Color(0xffC3C3C3);
Color errorDark = const Color.fromARGB(255, 255, 146, 146);
Color successDark = const Color.fromARGB(255, 132, 255, 83);
//-------------------------------------------------------------

//--------------------Duration--------------------------------
Duration animationDuration = const Duration(milliseconds: 200);
//-------------------------------------------------------------
String imageUrl = "";
FilterModel? selectedItem;
