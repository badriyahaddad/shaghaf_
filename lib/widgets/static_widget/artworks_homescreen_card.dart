import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/artists_provider.dart';
import 'package:shaghaf/providers/artwork_provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import '../../helpers/const.dart';
import '../../screens/sub_screens/artwork_details_screen.dart';
import '../../screens/sub_screens/common_artwork_screen.dart';
import 'gridview_card.dart';

class ArtWorkCard extends StatefulWidget {
  const ArtWorkCard({super.key, required this.hide});
  final bool hide;

  @override
  State<ArtWorkCard> createState() => _ArtWorkCardState();
}

class _ArtWorkCardState extends State<ArtWorkCard> {
  @override
  void initState() {
    Provider.of<ArtworkProvider>(context, listen: false)
        .loadArtWorkItemsFromFirestore();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final artworkListener =
        Provider.of<ArtworkProvider>(context, listen: false);
    final artistListenr = Provider.of<ArtistProvider>(context, listen: false);
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
                        style: TextStyle(
                            color: themeListener.isDark
                                ? titleTextColorDark
                                : titleTextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const CommonArtWorkScreen()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.more,
                          style: TextStyle(
                              fontSize: 18,
                              color: themeListener.isDark
                                  ? mainColorDark
                                  : mainColor),
                        ),
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
              itemCount: artworkListener.items.length,
              crossAxisCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ArtWorkDetailsScreen(
                              artistIamge:
                                  artworkListener.items[index].image ?? "",
                              artistName:
                                  artworkListener.items[index].artistName ?? "",
                              catagory: AppLocalizations.of(context)!
                                          .localeName ==
                                      'ar'
                                  ? artworkListener.items[index].catagoryAr ??
                                      ""
                                  : artworkListener.items[index].catagoryEn ??
                                      "",
                              artistPic: artistListenr.items[index].artistImage,
                              price:
                                  artworkListener.items[index].price.toString(),
                            )));
                  },
                  child: GridViewCard(
                    index: index,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
