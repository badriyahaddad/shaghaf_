import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import '../../helpers/const.dart';
import '../../widgets/static_widget/artworks_homescreen_card.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
import '../../widgets/static_widget/profile_card.dart';

class ProfileArtistDetailsScreen extends StatefulWidget {
  const ProfileArtistDetailsScreen({
    super.key,
    required this.artistName,
    required this.artWorkImage,
    required this.workCatagory,
  });
  final String workCatagory;
  final String artistName;
  final String artWorkImage;
  @override
  State<ProfileArtistDetailsScreen> createState() =>
      _ProfileArtistDetailsScreenState();
}

class _ProfileArtistDetailsScreenState
    extends State<ProfileArtistDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CostuomAppBar(
                  menueFunction: () {},
                  isDetails: false,
                  isHome: false,
                  profileName: '',
                  title: AppLocalizations.of(context)!.homescreencommonartits,
                  isOtherScreens: false,
                  iconBehavior: () {
                    Navigator.pop(context);
                  },
                  iconData: const Icon(Icons.arrow_back),
                  subTitle: '',
                ),
              ),
              SizedBox(
                height: size.width / 1.4,
                width: size.width,
                child: ProfileCard(
                  artWorkImage: widget.artWorkImage,
                  artistName: widget.artistName,
                  workCatagory: widget.workCatagory,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  AppLocalizations.of(context)!.detailsartitsworks,
                  style: TextStyle(
                      color: themeListener.isDark
                          ? titleTextColorDark
                          : titleTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const ArtWorkCard(
                hide: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
