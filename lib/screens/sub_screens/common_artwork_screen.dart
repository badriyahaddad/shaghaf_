import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/static_widget/artworks_homescreen_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class CommonArtWorkScreen extends StatefulWidget {
  const CommonArtWorkScreen({super.key});

  @override
  State<CommonArtWorkScreen> createState() => _CommonArtWorkScreenState();
}

class _CommonArtWorkScreenState extends State<CommonArtWorkScreen> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CostuomAppBar(
              menueFunction: () {},
              isDetails: false,
              isHome: false,
              iconBehavior: () {
                Navigator.pop(context);
              },
              profileName: '',
              title: AppLocalizations.of(context)!.homescreencommonart,
              isOtherScreens: false,
              iconData: const Icon(Icons.arrow_back),
              subTitle: '',
            ),
          ),
          const ArtWorkCard(
            hide: false,
          ),
        ],
      )),
    );
  }
}
