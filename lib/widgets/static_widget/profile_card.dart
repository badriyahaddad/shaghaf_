import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/static_widget/coustom_appbar.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard(
      {super.key,
      required this.artistName,
      required this.artistImage,
      required this.workCatagory});
  final String artistName;
  final String artistImage;
  final String workCatagory;
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          top: 100,
          child: Container(
            height: size.height / 5,
            width: size.width / 1.2,
            decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                border: Border.all(color: const Color(0xff949494), width: 0.3),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
        Positioned(
          top: 60,
          child: CircleAvatar(
            maxRadius: 50,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              widget.artistImage,
              fit: BoxFit.cover,
              width: size.width / 1,
            ),
          ),
        ),
        Positioned(
          top: 170,
          child: Column(
            children: [
              Text(
                widget.artistName,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.workCatagory,
                style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
              ),
              SizedBox(
                height: size.height / 90,
              ),
              const Icon(Icons.facebook)
            ],
          ),
        )
      ],
    );
  }
}
