import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
import '../static_widget/settings_card.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserImageCard extends StatefulWidget {
  const UserImageCard({super.key, required this.onFileChanged});
  final Function(String imageUserUrl) onFileChanged;

  @override
  State<UserImageCard> createState() => _UserImageCardState();
}

class _UserImageCardState extends State<UserImageCard> {
  final ImagePicker _picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    //  final uploaderListener = Provider.of<ThemeProvider>(context, listen: false);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        _photo == null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  themeListener.isDark
                      ? "assets/icons/user_reg_Dark.png"
                      : "assets/icons/user_reg.png",
                  width: size.width / 3,
                ),
              )
            : InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => selectPhoto(),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        maxRadius: size.width / 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            imageUserUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.photo);
                            },
                          ),
                        )),
                  ),
                )),
        Positioned(
            top: _photo != null ? 460 : 120,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => selectPhoto(),
              child: Icon(
                Icons.camera_alt,
                size: 35,
                color: themeListener.isDark ? subTitleColorDark : subTitleColor,
              ),
            ))
      ],
    );
  }

  Future selectPhoto() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) => Column(
          children: [
            SettingsCard(
              icon: const Icon(Icons.photo_camera_back_outlined),
              nextIcon: const Icon(Icons.navigate_next_rounded),
              title: AppLocalizations.of(context)!.gallrey,
              isLogOutCard: false,
              iconBehavior: () {
                Navigator.of(context).pop();
                imgFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile(context);
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

  Future uploadFile(BuildContext context) async {
    if (_photo == null) return;

    try {
      final ref =
          firebase_storage.FirebaseStorage.instance.ref().child('user_images');
      await ref.putFile(_photo!).then((value) async {
        String url = (await ref.getDownloadURL()).toString();
        setState(() {
          imageUserUrl = url;
        });
        if (kDebugMode) {
          print("this is the url $url");
        }
      });
    } catch (e) {
      // print('error occured');
    }
  }
}
