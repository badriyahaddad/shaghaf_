import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
import '../clikable_widgets/button.dart';

class ArtworkDetailsCard extends StatefulWidget {
  const ArtworkDetailsCard(
      {super.key,
      required this.artistName,
      required this.artistIamge,
      required this.catagory,
      required this.artistPic});
  final String artistName;
  final String artistIamge;
  final String catagory;
  final String artistPic;
  @override
  State<ArtworkDetailsCard> createState() => _ArtworkDetailsCardState();
}

class _ArtworkDetailsCardState extends State<ArtworkDetailsCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.1,
        maxChildSize: 0.4,
        expand: true,
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: scrollController,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(
                top: 0.01,
              ),
              height: 0.40 * getSize(context).height,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 20.0,
                      offset: const Offset(0.0, 5.0),
                      color: themeListener.isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.1),
                    )
                  ],
                  color: themeListener.isDark
                      ? backgroundColorDark
                      : backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width / 150,
                    height: size.height / 150,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          child: CircleAvatar(
                              maxRadius: size.width / 10,
                              child: Image.asset(
                                widget.artistPic,
                                fit: BoxFit.cover,
                                width: size.width / 1,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height / 30,
                              ),
                              Text(
                                widget.artistName,
                                style: TextStyle(
                                    color: themeListener.isDark
                                        ? titleTextColorDark
                                        : titleTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.catagory,
                                style: TextStyle(
                                    color: themeListener.isDark
                                        ? subTitleColorDark
                                        : subTitleColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height / 60,
                              ),
                              SizedBox(
                                width: size.width / 2,
                                child: Text(
                                  AppLocalizations.of(context)!.loremipsum,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: themeListener.isDark
                                        ? subTitleColorDark
                                        : subTitleColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Button(
                      borderButton: true,
                      color: themeListener.isDark
                          ? secondrayColorDark
                          : secondrayColor,
                      loading: false,
                      onClick: () {},
                      isActive: false,
                      screenHieght: size.height / 17,
                      screenWidth: size.width,
                      txt: AppLocalizations.of(context)!.book,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
