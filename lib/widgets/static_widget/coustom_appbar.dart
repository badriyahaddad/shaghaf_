import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../input_widget/text_field.dart';

class CostuomAppBar extends StatefulWidget {
  const CostuomAppBar({
    super.key,
    required this.profileName,
    required this.isHome,
    required this.title,
    required this.isOtherScreens,
  });
  final String profileName;
  final bool isHome;
  final String title;
  final bool isOtherScreens;
  @override
  State<CostuomAppBar> createState() => _CostuomAppBarState();
}

class _CostuomAppBarState extends State<CostuomAppBar> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: widget.isHome
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: widget.isOtherScreens
                            ? Image.asset("assets/profilehomescreen.png")
                            : const Icon(
                                Icons.settings,
                                color: Colors.black,
                              ),
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/icons/menu.png")),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  widget.isOtherScreens
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .homescreenappbar,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.profileName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .homescreenappbarsubtitle,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff9C9C9C)),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 30,
                            ),
                            SizedBox(
                              width: size.width,
                              child: TextFieldWidget(
                                isPassword: false,
                                prefix:
                                    Image.asset("assets/icons/serachicon.png"),
                                textFieldController: searchController,
                                node: TextInputAction.search,
                                isVisable: false,
                                hintTxt: AppLocalizations.of(context)!.search,
                                keyboardType: TextInputType.visiblePassword,
                                validtion: (value) {},
                                obscureText: false,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              )
            : Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: size.width / 4,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ));
  }
}
