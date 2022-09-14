import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_thema/app_thema.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final appThema app_thema;
  final String appbar_title;
  CustomAppBar(this.app_thema, this.appbar_title);
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: app_thema.darkest,
      title: Text(appbar_title,
          style:
              GoogleFonts.raleway(fontSize: 26, fontWeight: FontWeight.bold)),
    );
  }
}
