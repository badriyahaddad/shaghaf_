import 'package:flutter/material.dart';

import '../../helpers/const.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      decoration: InputDecoration(
        // counter: GestureDetector(
        //   child: widget.isPassword
        //       ? Text(
        //           AppLocalizations.of(context)!.loginmsgbuttonforgetpassword,
        //           style: const TextStyle(
        //             color: Color(0xff949494),
        //           ),
        //         )
        //       : null,
        // ),
        isDense: true,
        prefixIcon: widget.prefix,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                    widget.isVisable ? Icons.visibility_off : Icons.visibility,
                    color: buttomColor),
                onPressed: () {
                  setState(() {
                    widget.isVisable = !widget.isVisable;
                  });
                },
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: widget.hintTxt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
