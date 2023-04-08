import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../clikable_widgets/icon_widget.dart';

class GridViewCard extends StatefulWidget {
  const GridViewCard({super.key, required this.index});
  final int index;
  @override
  State<GridViewCard> createState() => _GridViewCardState();
}

//Fake List
List fakeList = [
  "assets/artwork1.png",
  "assets/artwork2.png",
  "assets/artwork3.png",
  "assets/artwork4.png"
];

class _GridViewCardState extends State<GridViewCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          fakeList[widget.index],
          fit: BoxFit.cover,
          width: size.width / 1,
        ),
        Positioned(
          left: AppLocalizations.of(context)!.localeName == 'ar' ? 5 : 12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconWidget(
              icon: isFav ? Icons.favorite : Icons.favorite_border,
              isAppbar: true,
              isFave: isFav,
              isSize: size.width / 15,
              onClick: () {
                setState(() {
                  isFav = !isFav;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
