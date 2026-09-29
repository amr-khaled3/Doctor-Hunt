import 'package:doctor_hunt/core/router/app_route_name.dart';
import 'package:doctor_hunt/core/widgets/Custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../i18n/strings.g.dart';
import '../../widgets/role/role_card.dart';

enum RoleType { patient, admin }

class Role extends StatefulWidget {
  const Role({super.key});

  @override
  State<Role> createState() => _RoleState();
}

class _RoleState extends State<Role> {
  RoleType? selectedRole;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final text = context.t.chooseRole;

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
                  text.title,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    fontSize: (size.width * 0.07).clamp(24.0, 28.0),
                    color: const Color(0xff17202A),
                  ),
                ),
                Text(
                  text.subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: (size.width * 0.055).clamp(12.0, 14.0),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff7B8490),
                  ),
                ),
                const Spacer(),
                RoleCard(
                  iconPath: "assets/icons/Patient_icon.svg",
                  title: text.patient.title,
                  description: text.patient.description,
                  isSelected: selectedRole == RoleType.patient,
                  onTap: () => setState(() => selectedRole = RoleType.patient),
                ),
                SizedBox(height: size.height * 0.02),
                RoleCard(
                  iconPath: "assets/icons/Admin_icon.svg",
                  title: text.admin.title,
                  description: text.admin.description,
                  isSelected: selectedRole == RoleType.admin,
                  onTap: () => setState(() => selectedRole = RoleType.admin),
                ),
                const Spacer(flex: 2),
                CustomBtn(
                  title: text.continueButton,
                  textSize: size.width * 0.045,
                  onPress: selectedRole == null
                      ? null
                      : () {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteName.login,
                            arguments: selectedRole, // role is now passed on
                          );
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
