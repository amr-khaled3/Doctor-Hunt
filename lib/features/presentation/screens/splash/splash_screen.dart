import 'package:animate_do/animate_do.dart';
import 'package:doctor_hunt/core/router/app_route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInDownBig(
              duration: Duration(milliseconds: 1500),
              child: Hero(
                tag: 'logo',
                child: Image.asset("assets/logos/app_logo.png"),
              ),
            ),
            SizedBox(height: 11),
            FadeInUpBig(
              duration: Duration(milliseconds: 1500),
              child: Center(
                child: Hero(
                  tag: 'title',
                  child: Text(
                    "Doctor Hunt",
                    style: GoogleFonts.rubik(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onFinish: (direction) {
                Navigator.pushReplacementNamed(context, RouteName.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
