import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/screens/auth_screen/forget_password.dart';
import '../../helpers/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/theme_provider.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    super.key,
    required this.validtion,
    required this.hintTxt,
    required this.keyboardType,
    required this.obscureText,
    required this.isVisable,
    required this.node,
    required this.textFieldController,
    required this.prefix,
    required this.isPassword,
    required this.isDiscription,
  });
  final Function validtion;
  final TextInputType keyboardType;
  final String hintTxt;
  bool isVisable;
  final bool obscureText;
  final TextEditingController textFieldController;
  final TextInputAction node;
  final Widget? prefix;
  final bool isPassword;
  final bool isDiscription;
  Function? search;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);

    return TextFormField(
      maxLines: widget.isDiscription ? 5 : 1,
      style: TextStyle(
          color: themeListener.isDark ? titleTextColorDark : titleTextColor),
      // inputFormatters: [
      //   LengthLimitingTextInputFormatter(1),
      // ],
      obscureText: widget.isVisable ? false : widget.obscureText,
      controller: widget.textFieldController,

      keyboardType: widget.keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return widget.validtion(value);
      },
      onSaved: (value) {
        widget.textFieldController.text = value!;
      },
      textInputAction: widget.node,
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
      },
      cursorColor: themeListener.isDark ? mainColorDark : mainColor,

      decoration: InputDecoration(
        counter: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ForgetPassword()));
                },
                child: Text(
                  AppLocalizations.of(context)!.loginmsgbuttonforgetpassword,
                  style: TextStyle(
                    color: themeListener.isDark
                        ? subTitleColorDark
                        : subTitleColor,
                  ),
                ))
            : null,
        isDense: true,
        prefixIcon: widget.prefix,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                    widget.isVisable ? Icons.visibility_off : Icons.visibility,
                    color: themeListener.isDark ? mainColorDark : mainColor),
                onPressed: () {
                  setState(() {
                    widget.isVisable = !widget.isVisable;
                  });
                },
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hint text
        hintText: widget.hintTxt,
// hint text style
        hintStyle: TextStyle(
            color: themeListener.isDark
                ? subTitleColorDark.withOpacity(0.4)
                : subTitleColor.withOpacity(0.4)),
        //when the text field is activated
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 3,
              color: themeListener.isDark ? mainColorDark : mainColor),
          borderRadius: BorderRadius.circular(8),
        ),
        //not activated
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        //when the text field is disabled
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: themeListener.isDark ? mainColorDark : mainColor),
          borderRadius: BorderRadius.circular(8),
        ),
        //there's an error in the textfeiled
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeListener.isDark ? errorDark : error,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        //when it's enabled
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: themeListener.isDark
                  ? mainColorDark.withOpacity(0.4)
                  : mainColor.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        setState(() {
          widget.search!();
        });
      },
    );
  }
}
