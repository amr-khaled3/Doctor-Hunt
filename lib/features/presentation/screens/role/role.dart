import 'package:doctor_hunt/core/router/app_route_name.dart';
import 'package:doctor_hunt/core/widgets/Custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Role extends StatefulWidget {
  const Role({super.key});

  @override
  State<Role> createState() => _RoleState();
}

class _RoleState extends State<Role> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final double checkSize = (size.width * 0.06).clamp(20.0, 28.0);
    final double cardRadius = (size.width * 0.05).clamp(16.0, 20.0);

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
            padding: EdgeInsets.symmetric(
              horizontal: (size.width * 0.05).clamp(16.0, 24.0),
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset("assets/logos/app_logo.png"),
                ),

                Hero(
                  tag: 'title',
                  child: Text(
                    "Doctor Hunt",
                    style: GoogleFonts.rubik(
                      fontSize: (size.width * 0.06).clamp(22.0, 25.0),
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff222222),
                    ),
                  ),
                ),

                const Spacer(),

                Text(
                  "Choose your role",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    fontSize: (size.width * 0.07).clamp(24.0, 28.0),
                    color: const Color(0xff17202A),
                  ),
                ),

                Text(
                  textAlign: TextAlign.center,
                  "The selected role determines the experience and \navailable features.",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: (size.width * 0.035).clamp(12.0, 14.0),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff7B8490),
                  ),
                ),

                const Spacer(),

                InkWell(
                  onTap: () {
                    setState(() {
                      selectedRole = "patient";
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          (size.width * 0.04).clamp(12.0, 16.0),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(cardRadius),
                          border: Border.all(
                            width: 1.75,
                            color: selectedRole == "patient"
                                ? const Color(0xff006C49)
                                : const Color(0xff7B8490),
                          ),
                          color: selectedRole == "patient"
                              ? const Color(0x4dd5e6e1)
                              : const Color(0xffFAFCFB),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: (size.width * 0.06).clamp(20.0, 24.0),
                            vertical: (size.height * 0.025).clamp(18.0, 24.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Patient_icon.svg",
                                width: (size.width * 0.12).clamp(36.0, 48.0),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Patient",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: (size.width * 0.05)
                                            .clamp(18.0, 20.0),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    Text(
                                      "Find doctors, book\nappointments,\nand manage your medical\nrecords.",
                                      softWrap: true,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: (size.width * 0.035)
                                            .clamp(12.0, 14.0),
                                        color: const Color(0xff7B8490),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      if (selectedRole == "patient")
                        Positioned(
                          top: (size.width * 0.035).clamp(10.0, 16.0),
                          right: (size.width * 0.035).clamp(10.0, 16.0),
                          child: Icon(
                            Icons.check_circle,
                            size: checkSize,
                            color: const Color(0xff006C49),
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                InkWell(
                  enableFeedback: false,
                  onTap: () {
                    setState(() {
                      selectedRole = "admin";
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          (size.width * 0.04).clamp(12.0, 16.0),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(cardRadius),
                          border: Border.all(
                            width: 1.75,
                            color: selectedRole == "admin"
                                ? const Color(0xff006C49)
                                : const Color(0xff7B8490),
                          ),
                          color: selectedRole == "admin"
                              ? const Color(0x4dd5e6e1)
                              : const Color(0xffFAFCFB),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: (size.width * 0.06).clamp(20.0, 24.0),
                            vertical: (size.height * 0.025).clamp(18.0, 24.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Admin_icon.svg",
                                width: (size.width * 0.12).clamp(36.0, 48.0),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Admin",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: (size.width * 0.05)
                                            .clamp(18.0, 20.0),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    Text(
                                      "Manage doctors, appointments, users, and the platform.",
                                      softWrap: true,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: (size.width * 0.035)
                                            .clamp(12.0, 14.0),
                                        color: const Color(0xff7B8490),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      if (selectedRole == "admin")
                        Positioned(
                          top: (size.width * 0.035).clamp(10.0, 16.0),
                          right: (size.width * 0.035).clamp(10.0, 16.0),
                          child: Icon(
                            Icons.check_circle,
                            size: checkSize,
                            color: const Color(0xff006C49),
                          ),
                        ),
                    ],
                  ),
                ),

                const Spacer(flex: 2),

                CustomBtn(
                  title: "Continue",
                  textSize: size.width * 0.045,
                  onPress: selectedRole == null
                      ? null
                      : () {
                    Navigator.pushReplacementNamed(context, RouteName.login);
                  },
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}