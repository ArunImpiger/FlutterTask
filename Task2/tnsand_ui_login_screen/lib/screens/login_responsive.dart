import 'package:flutter/material.dart';
import 'package:tnsand_ui_login_screen/screens/registration.dart';

class LoginResponsive extends StatefulWidget {
  const LoginResponsive({Key? key}) : super(key: key);

  @override
  State<LoginResponsive> createState() => _LoginResponsiveState();
}

class _LoginResponsiveState extends State<LoginResponsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: const Color(0xFF462E82),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
