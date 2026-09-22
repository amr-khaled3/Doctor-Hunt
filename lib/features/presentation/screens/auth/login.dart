import 'package:doctor_hunt/core/app_theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Join us to start searching",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xff000000),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "You can search course, apply course and find\nscholarship for abroad studies",
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.labelColor
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(12),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/google.svg",
                                  width: 18,
                                  height: 18,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Google",
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: AppColors.labelColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(12),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/facebook_icon.svg",
                                  width: 18,
                                  height: 18,
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xff3B5998),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Facebook",
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: AppColors.labelColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
