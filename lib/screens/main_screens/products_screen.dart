import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/filter_button.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
import '../../widgets/static_widget/product_screen_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

List product = [
  //----------------------Books------------------------------------

  {
    "productcatagory": "Books",
    "producttitle": "Hobbit",
    "productimage": "assets/book1.jpg",
    "productprice": "200دل"
  },

  {
    "productcatagory": "Books",
    "producttitle": "Gullivers",
    "productimage": "assets/book2.jpg",
    "productprice": "250دل"
  },

  {
    "productcatagory": "Books",
    "producttitle": "The Man In The Woods",
    "productimage": "assets/book3.jpg",
    "productprice": "100دل"
  },

  {
    "productcatagory": "Books",
    "producttitle": "We, The Drowned",
    "productimage": "assets/book4.jpg",
    "productprice": "300دل"
  },
//-------------------Camera---------------------------------------

  {
    "productcatagory": "Camera",
    "producttitle": "قاعدة كاميرا",
    "productimage": "assets/camera1.png",
    "productprice": "500دل"
  },

  {
    "productcatagory": "Camera",
    "producttitle": "انارة",
    "productimage": "assets/camera2.png",
    "productprice": "150دل"
  },

  {
    "productcatagory": "Camera",
    "producttitle": "عدسة كاميرا",
    "productimage": "assets/camera3.png",
    "productprice": "1000دل"
  },

  {
    "productcatagory": "Camera",
    "producttitle": "كاميرا فورية",
    "productimage": "assets/camera4.png",
    "productprice": "250دل",
  },
//-------------------Swings---------------------------------------

  {
    "productcatagory": "Swing",
    "producttitle": "سلك خياطة",
    "productimage": "assets/swing1.png",
    "productprice": "10دل"
  },

  {
    "productcatagory": "Swing",
    "producttitle": "مقص",
    "productimage": "assets/swing2.png",
    "productprice": "50دل"
  },

  {
    "productcatagory": "Swing",
    "producttitle": "مقياس",
    "productimage": "assets/swing3.png",
    "productprice": "50دل"
  },

  {
    "productcatagory": "Swing",
    "producttitle": "ادوات الخياطة",
    "productimage": "assets/swing4.png",
    "productprice": "250دل"
  },

// //-------------------Music---------------------------------------

  {
    "productcatagory": "Music",
    "producttitle": "ميكروفون",
    "productimage": "assets/music1.png",
    "productprice": "10دل"
  },

  {
    "productcatagory": "Music",
    "producttitle": "ميكروفون",
    "productimage": "assets/music2.png",
    "productprice": "50دل"
  },

  {
    "productcatagory": "Music",
    "producttitle": "قيتار",
    "productimage": "assets/music3.png",
    "productprice": "50دل"
  },

  {
    "productcatagory": "Music",
    "producttitle": "تشيلو",
    "productimage": "assets/music4.png",
    "productprice": "250دل"
  },
];

class _ProductScreenState extends State<ProductScreen> {
  int selectedTabIndex = 0;

  List cart = [];
  @override
  Widget build(BuildContext context) {
    //fake list
    List filters = [
      AppLocalizations.of(context)!.filterbuttonall,
      "كتب",
      "كاميرا",
      "ادوات الخياطة",
      "موسيقى"
    ];

    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 70,
              ),
              CostuomAppBar(
                iconBehavior: () {},
                isDetails: false,
                iconData: Image.asset(
                  themeListener.isDark
                      ? "assets/icons/cartIcon_Dark.png"
                      : "assets/icons/cartIcon.png",
                  width: size.width / 5,
                ),
                isOtherScreens: false,
                isHome: true,
                profileName: '',
                title: AppLocalizations.of(context)!.productscreenappbartitle,
                subTitle: '',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "${AppLocalizations.of(context)!.cartno} ${cart.length}",
                  style: TextStyle(
                      color: themeListener.isDark
                          ? titleTextColorDark
                          : titleTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: size.height / 70,
              ),
              SizedBox(
                  height: size.height / 15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      return FilterButton(
                        btnTitle: filters[index],
                        isSelected: selectedTabIndex == index,
                        onClick: () {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                      );
                    },
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return ProductScreenCard(
                      producTitle: product[index]['producttitle'],
                      productImage: product[index]['productimage'],
                      productPrice: product[index]['productprice'],
                      productSubTitle: product[index]['productcatagory'],
                      iconBehavior: () {
                        setState(() {
                          cart.add(product[index]);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
