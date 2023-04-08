import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../helpers/const.dart';
import 'gridview_card.dart';

class ArtWorkCard extends StatefulWidget {
  const ArtWorkCard({super.key, required this.hide});
  final bool hide;
  @override
  State<ArtWorkCard> createState() => _ArtWorkCardState();
}

//Fake List
List fakeList = [
  "assets/artwork1.png",
  "assets/artwork2.png",
  "assets/artwork3.png",
  "assets/artwork4.png"
];

class _ArtWorkCardState extends State<ArtWorkCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: widget.hide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.homescreencommonart,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        AppLocalizations.of(context)!.more,
                        style: TextStyle(fontSize: 18, color: mainColor),
                      ),
                    ],
                  )
                : null),
        SizedBox(
          height: size.height / 70,
        ),
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MasonryGridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: fakeList.length,
              crossAxisCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return GridViewCard(
                  index: index,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
