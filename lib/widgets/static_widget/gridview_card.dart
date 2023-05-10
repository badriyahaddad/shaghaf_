import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/widgets/static_widget/shimmer_widget.dart';
import '../../helpers/const.dart';
import '../../providers/artwork_provider.dart';
import '../../providers/theme_provider.dart';
import '../clikable_widgets/icon_widget.dart';

class GridViewCard extends StatefulWidget {
  const GridViewCard({super.key, required this.index});
  final int index;

  @override
  State<GridViewCard> createState() => _GridViewCardState();
}

class _GridViewCardState extends State<GridViewCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final artworkListener =
        Provider.of<ArtworkProvider>(context, listen: false);
    return artworkListener.isLoading
        ? ShimmerWidget(
            baseColor: themeListener.isDark ? cardColorDark : cardColor,
            height: size.height / 5,
            hilighColor:
                themeListener.isDark ? backgroundColorDark : backgroundColor,
            radius: 16,
            width: size.width,
          )
        : Stack(
            children: [
              Container(
                foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(0, 0, 0, 0),
                          Color.fromARGB(103, 0, 0, 0),
                          Color.fromARGB(153, 0, 0, 0),
                          Color.fromARGB(232, 0, 0, 0)
                        ])),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    artworkListener.items[widget.index].image!,
                    fit: BoxFit.cover,
                    width: size.width / 1,
                  ),
                ),
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
