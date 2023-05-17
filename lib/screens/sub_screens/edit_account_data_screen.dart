import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/auth_provider.dart';
import 'package:shaghaf/screens/auth_screen/forget_password.dart';
import '../../helpers/const.dart';
import '../../models/user_model.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/clikable_widgets/button.dart';
import '../../widgets/input_widget/text_field.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
import '../../widgets/static_widget/settings_card.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditAccountDataScreen extends StatefulWidget {
  const EditAccountDataScreen({super.key});

  @override
  State<EditAccountDataScreen> createState() => _EditAccountDataScreenState();
}

class _EditAccountDataScreenState extends State<EditAccountDataScreen> {
  final ImagePicker _picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  // controllers of the textfields
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  //key form
  final formkey = GlobalKey<FormState>();

  //variable to preform the validate function to check wether the textfields values are valid or not!
  bool enableLoginBtn = false;
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final userListener = Provider.of<AuthProvider>(context, listen: true);
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
            menueFunction: () {},
            isDetails: false,
            isHome: false,
            profileName: '',
            title: AppLocalizations.of(context)!.editaccountdata,
            isOtherScreens: false,
            iconBehavior: () {
              Navigator.pop(context);
            },
            iconData: const Icon(Icons.arrow_back),
            subTitle: '',
          ),
          SizedBox(
            height: size.height / 15,
          ),
          Form(
            //form that are assigned for textfield, so the user can enter thier data
            key: formkey,
            onChanged: () {
              setState(() {
                //enableLoginBtn put in setState in onchange function so basically it listened to the changes of states of any of the textfields
                enableLoginBtn = formkey.currentState!.validate();
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coulmn of welcome statments
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          //create your account text
                          AppLocalizations.of(context)!.changeyourdatatitle,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: themeListener.isDark
                                  ? titleTextColorDark
                                  : titleTextColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          // helper text
                          AppLocalizations.of(context)!.changeyourdatasubtitle,
                          style: TextStyle(
                              fontSize: 20,
                              color: themeListener.isDark
                                  ? subTitleColorDark
                                  : subTitleColor),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          selectPhoto();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: CircleAvatar(
                            backgroundColor: themeListener.isDark
                                ? cardColorDark
                                : cardColor,
                            maxRadius: 50,
                            child: Image.network(
                              userListener.currentUser?.image ?? "",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.photo);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //vertical space
                  SizedBox(height: size.height / 70),
                  //textfield name
                  TextFieldWidget(
                    search: () {},
                    isDiscription: false,
                    prefix: Image.asset(themeListener.isDark
                        ? "assets/icons/nameIcon_Dark.png"
                        : "assets/icons/nameIcon.png"),
                    textFieldController: nameController,
                    node: TextInputAction.next,
                    isVisable: true,
                    hintTxt: AppLocalizations.of(context)!.hintname,
                    keyboardType: TextInputType.name,
                    validtion: (value) {
                      RegExp regExp = RegExp(r'^.{2,}$');
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.validtionemptyname;
                      }
                      if (!regExp.hasMatch(value)) {
                        return AppLocalizations.of(context)!
                            .validtioninvalidname;
                      }
                      return null;
                    },
                    obscureText: false,
                    isPassword: false,
                  ),
                  //vertical space
                  SizedBox(
                    height: size.height / 70,
                  ),
                  //textfield email
                  TextFieldWidget(
                    search: () {},
                    isDiscription: false,
                    isPassword: false,
                    textFieldController: emailController,
                    node: TextInputAction.next,
                    isVisable: false,
                    hintTxt: AppLocalizations.of(context)!.hintemail,
                    keyboardType: TextInputType.emailAddress,
                    validtion: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!
                            .validtionemptyemail;
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return AppLocalizations.of(context)!
                            .validtioninvalidemail;
                      }
                      return null;
                    },
                    obscureText: false,
                    prefix: Image.asset(themeListener.isDark
                        ? "assets/icons/emailIcon_Dark.png"
                        : "assets/icons/emailIcon.png"),
                  ),
                ],
              ),
            ),
          ),
          //vertical space
          SizedBox(
            height: size.height / 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SettingsCard(
              icon: Image.asset(themeListener.isDark
                  ? "assets/icons/passwordIcon_Dark.png"
                  : "assets/icons/passwordIcon.png"),
              nextIcon: const Icon(Icons.navigate_next_rounded),
              title: AppLocalizations.of(context)!.editpassword,
              isLogOutCard: false,
              iconBehavior: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const ForgetPassword()));
              },
            ),
          ),
          //vertical space
          SizedBox(
            height: size.height / 30,
          ),
          //button to confirm signing up to the system
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Button(
                color: themeListener.isDark ? mainColorDark : mainColor,
                screenWidth: size.width,
                screenHieght: size.height * 0.061,
                borderButton: false,
                txt: AppLocalizations.of(context)!.editbutton,
                loading: false,
                isActive: enableLoginBtn,
                onClick: () {
                  UserModel updatedUser = UserModel(
                    uid: userListener.currentUser!.uid,
                    email: emailController.text.toString().trim(),
                    image: userListener.currentUser!.image,
                    catagory: userListener.currentUser!.catagory,
                    name: nameController.text.toString().trim(),
                    password: userListener.currentUser!.password,
                  );
                  // ignore: unused_local_variable
                  Map<String, dynamic> updatedUserData = updatedUser.toMap();
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      formkey.currentState!.save();
                    });
                  }
                }),
          )
        ]))));
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
