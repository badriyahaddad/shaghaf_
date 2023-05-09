import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/cart_provider.dart';
import 'package:shaghaf/providers/filter_provider.dart';

import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/filter_button.dart';

import '../../widgets/static_widget/product_screen_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedTabIndex = 0;
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false)
        .loadCartItemsFromFirestore(null);
    Provider.of<FilterProvider>(context, listen: false)
        .loadFilterFromFirestore();
    Provider.of<CartProvider>(context, listen: false).cartList.clear();
    super.initState();
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final filterListener = Provider.of<FilterProvider>(context, listen: true);
    return Consumer<CartProvider>(builder: (context, cartConsumer, _) {
      return RefreshIndicator(
        onRefresh: () async {
          cartConsumer.loadCartItemsFromFirestore(null);
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.cartno} ${cartConsumer.cartList.length}",
                        style: TextStyle(
                            color: themeListener.isDark
                                ? titleTextColorDark
                                : titleTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              cartConsumer.cartList.clear();
                            });
                          },
                          icon: const Icon(Icons.delete)),
                    ],
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
                      itemCount: filterListener.items.length,
                      itemBuilder: (context, index) {
                        return FilterButton(
                          btnTitle:
                              AppLocalizations.of(context)!.localeName == 'ar'
                                  ? filterListener.items[index].catagoryAr
                                  : filterListener.items[index].catagoryEn,
                          isSelected: selectedTabIndex == index,
                          onClick: () {
                            setState(() {
                              selectedTabIndex = index;
                            });
                            Provider.of<CartProvider>(context, listen: false)
                                .loadCartItemsFromFirestore(filterListener
                                            .items[index].catagoryAr ==
                                        "الكل"
                                    ? null
                                    : filterListener.items[index].catagoryAr);
                          },
                        );
                      },
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                    ),
                    shrinkWrap: true,
                    itemCount: cartConsumer.items.length,
                    itemBuilder: (context, index) {
                      return ProductScreenCard(
                        producTitle:
                            AppLocalizations.of(context)!.localeName == 'ar'
                                ? cartConsumer.items[index].titleAr
                                : cartConsumer.items[index].titleEn,
                        productImage: cartConsumer.items[index].image,
                        productPrice:
                            cartConsumer.items[index].price.toString(),
                        productSubTitle:
                            AppLocalizations.of(context)!.localeName == 'ar'
                                ? cartConsumer.items[index].catagoryAr
                                : cartConsumer.items[index].catagoryEn,
                        iconBehavior: () {
                          setState(() {
                            cartConsumer.cartList
                                .add(cartConsumer.items[index]);
                            cartConsumer.items[index].price += counter;
                            cartConsumer.cartList.toSet().toList();
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
    });
  }
}
