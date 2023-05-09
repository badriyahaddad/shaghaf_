import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/artwork_provider.dart';
import 'package:shaghaf/widgets/input_widget/text_field.dart';
import '../../helpers/const.dart';
import '../../providers/filter_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/input_widget/drop_dwon_menu.dart';
import '../../widgets/input_widget/artwork_image.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';

class AddFormArtworkScreen extends StatefulWidget {
  const AddFormArtworkScreen({super.key});

  @override
  State<AddFormArtworkScreen> createState() => _AddFormArtworkScreenState();
}

class _AddFormArtworkScreenState extends State<AddFormArtworkScreen> {
  @override
  void initState() {
    Provider.of<FilterProvider>(context, listen: false)
        .loadFilterFromFirestore();
    super.initState();
  }

  final priceController = TextEditingController();
  final discrptionController = TextEditingController();
  //key form for the textfield
  final formkey = GlobalKey<FormState>();
  bool enableLoginBtn = false;
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final itemListener = Provider.of<ArtworkProvider>(context, listen: false);
    final filterListener = Provider.of<FilterProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                title: AppLocalizations.of(context)!.addnewartwork,
                isOtherScreens: false,
                iconData: const Icon(Icons.arrow_back),
                subTitle: '',
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            //textfield email
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //title
                      AppLocalizations.of(context)!.addprice,
                      style: TextStyle(
                          color: themeListener.isDark
                              ? titleTextColorDark
                              : titleTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    TextFieldWidget(
                      isDiscription: false,
                      isPassword: false,
                      textFieldController: priceController,
                      node: TextInputAction.next,
                      isVisable: false,
                      hintTxt: AppLocalizations.of(context)!.addpricehint,
                      keyboardType: TextInputType.number,
                      validtion: (value) {},
                      obscureText: false,
                      prefix: Image.asset(
                        themeListener.isDark
                            ? "assets/icons/dollar_Drak.png"
                            : "assets/icons/dollar.png",
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Text(
                      //title
                      AppLocalizations.of(context)!.adddiscription,
                      style: TextStyle(
                          color: themeListener.isDark
                              ? titleTextColorDark
                              : titleTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    TextFieldWidget(
                      isDiscription: true,
                      isPassword: false,
                      textFieldController: discrptionController,
                      node: TextInputAction.next,
                      isVisable: false,
                      hintTxt: AppLocalizations.of(context)!.adddiscrptionhint,
                      keyboardType: TextInputType.multiline,
                      validtion: (value) {},
                      obscureText: false,
                      prefix: Image.asset(
                        themeListener.isDark
                            ? "assets/icons/info_Drak.png"
                            : "assets/icons/info.png",
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Text(
                      //title
                      AppLocalizations.of(context)!.addcatagoryhint,
                      style: TextStyle(
                          color: themeListener.isDark
                              ? titleTextColorDark
                              : titleTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    DropDownMenueWidget(
                      items: filterListener.items,
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Text(
                      //title
                      AppLocalizations.of(context)!.addimage,
                      style: TextStyle(
                          color: themeListener.isDark
                              ? titleTextColorDark
                              : titleTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    Center(
                      child: ArtWorkImage(
                        onFileChanged: (imageUrl) {
                          setState(() {
                            imageUrl = imageUrl;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Button(
                      borderButton: false,
                      color: themeListener.isDark ? mainColorDark : mainColor,
                      loading: false,
                      onClick: () {
                        itemListener.postDetailsToFirestore(
                            priceController.text.toString(),
                            imageUrl,
                            discrptionController.text.toString(),
                            filterListener.selectedItem!.catagoryAr.toString(),
                            filterListener.selectedItem!.catagoryEn.toString());
                      },
                      screenHieght: size.height / 16,
                      screenWidth: size.width / 1.1,
                      txt: AppLocalizations.of(context)!.addbutton,
                      isActive: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
