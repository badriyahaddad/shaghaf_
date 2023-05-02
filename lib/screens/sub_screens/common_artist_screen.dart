import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:shaghaf/screens/sub_screens/profile_artist_details_screen.dart';
import '../../providers/artists_provider.dart';
import '../../widgets/static_widget/common_artist_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class CommonArtistScreen extends StatefulWidget {
  const CommonArtistScreen({super.key});

  @override
  State<CommonArtistScreen> createState() => _CommonArtistScreenState();
}

class _CommonArtistScreenState extends State<CommonArtistScreen> {
  // @override
  // void initState() {
  //   Provider.of<ArtistProvider>(context, listen: false)
  //       .loadArtistFromFirestore();
  //   super.initState();
  // }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<ArtistProvider>(context, listen: false)
          .loadArtistFromFirestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Consumer<ArtistProvider>(builder: (context, artistConsumer, _) {
        return SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CostuomAppBar(
                menueFunction: () {},
                iconBehavior: () {
                  Navigator.pop(context);
                },
                isDetails: false,
                isHome: false,
                profileName: '',
                title: AppLocalizations.of(context)!.homescreencommonartits,
                isOtherScreens: false,
                iconData: const Icon(
                  Icons.arrow_back,
                ),
                subTitle: '',
              ),
            ),
            SizedBox(
              width: size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: GridView.builder(
                  itemCount: artistConsumer.items.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (kDebugMode) {
                      print(
                          'image:  ${artistConsumer.items[index].artistImage} ');
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ProfileArtistDetailsScreen(
                                  artWorkImage:
                                      artistConsumer.items[index].artistImage,
                                  artistName:
                                      artistConsumer.items[index].artistName,
                                  workCatagory:
                                      artistConsumer.items[index].catagoryAr,
                                )));
                      },
                      child: CommonArtistCard(
                        artistName: artistConsumer.items[index].artistName,
                        catagory: artistConsumer.items[index].catagoryAr,
                        artistPic: artistConsumer.items[index].artistImage,
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                ),
              ),
            )
          ],
        ));
      }),
    );
  }
}
