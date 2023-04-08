import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/static_widget/artworks_card.dart';
import '../../widgets/static_widget/coustom_appbar.dart';
import '../../widgets/static_widget/profile_card.dart';

class ProfileArtistDetailsScreen extends StatefulWidget {
  const ProfileArtistDetailsScreen({
    super.key,
    required this.artistName,
    required this.artistImage,
    required this.workCatagory,
  });
  final String workCatagory;
  final String artistName;
  final String artistImage;
  @override
  State<ProfileArtistDetailsScreen> createState() =>
      _ProfileArtistDetailsScreenState();
}

class _ProfileArtistDetailsScreenState
    extends State<ProfileArtistDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CostuomAppBar(
                  isHome: false,
                  profileName: '',
                  title: AppLocalizations.of(context)!.homescreencommonartits,
                  isOtherScreens: false,
                ),
              ),
              SizedBox(
                height: size.width / 1.2,
                width: size.width,
                child: ProfileCard(
                  artistImage: widget.artistImage,
                  artistName: widget.artistName,
                  workCatagory: widget.workCatagory,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  AppLocalizations.of(context)!.detailsartitsworks,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
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
