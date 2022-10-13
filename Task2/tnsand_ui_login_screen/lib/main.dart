import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnsand_ui_login_screen/screens/login.dart';
import 'package:tnsand_ui_login_screen/screens/login_responsive.dart';
import 'widget/textformfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: Login(),
    );
  }
}
