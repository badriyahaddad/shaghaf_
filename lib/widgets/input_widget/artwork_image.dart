import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
import '../static_widget/settings_card.dart';
// ignore: depend_on_referenced_packages

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ArtWorkImage extends StatefulWidget {
  const ArtWorkImage({super.key, required this.onFileChanged});
  final Function(String imageurl) onFileChanged;

  @override
  State<ArtWorkImage> createState() => _ArtWorkImageState();
}

class _ArtWorkImageState extends State<ArtWorkImage> {
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
    return Column(
      children: [
        _photo == null
            ? SizedBox(
                width: size.width / 3,
                child: Image.asset(themeListener.isDark
                    ? "assets/icons/upload_Dark.png"
                    : "assets/icons/upload.png"),
              )
            : InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => selectPhoto(),
                child: Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.photo);
                    },
                  ),
                ))),
        InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => selectPhoto(),
            child: Text(
              _photo != null
                  ? AppLocalizations.of(context)!.imagechange
                  : AppLocalizations.of(context)!.imageselect,
              style: TextStyle(
                  color: themeListener.isDark
                      ? titleTextColorDark
                      : titleTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
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
              icon: const Icon(Icons.camera),
              nextIcon: const Icon(Icons.navigate_next_rounded),
              title: AppLocalizations.of(context)!.camera,
              isLogOutCard: false,
              iconBehavior: () {
                Navigator.of(context).pop();
                imgFromCamera();
              },
            ),
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

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

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
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('artwork_images');
      await ref.putFile(_photo!).then((value) async {
        String url = (await ref.getDownloadURL()).toString();
        setState(() {
          imageUrl = url;
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
