import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:shaghaf/providers/theme_provider.dart';
import '../../helpers/const.dart';
import '../../providers/artists_provider.dart';
import '../../screens/sub_screens/common_artist_screen.dart';
import '../../screens/sub_screens/profile_artist_details_screen.dart';

class ArtistListCard extends StatefulWidget {
  const ArtistListCard({super.key});

  @override
  State<ArtistListCard> createState() => _ArtistListCardState();
}

class _ArtistListCardState extends State<ArtistListCard> {
  @override
  void initState() {
    Provider.of<ArtistProvider>(context, listen: false)
        .loadArtistFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final artistListener = Provider.of<ArtistProvider>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.homescreencommonartits,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: themeListener.isDark
                      ? titleTextColorDark
                      : titleTextColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const CommonArtistScreen()));
                },
                child: Text(
                  AppLocalizations.of(context)!.more,
                  style: TextStyle(
                      fontSize: 18,
                      color: themeListener.isDark ? mainColorDark : mainColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height / 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: size.height / 9,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: artistListener.items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProfileArtistDetailsScreen(
                              artWorkImage:
                                  artistListener.items[index].artistImage,
                              artistName:
                                  artistListener.items[index].artistName,
                              workCatagory:
                                  artistListener.items[index].catagoryAr,
                            )));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.network(
                        artistListener.items[index].artistImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
