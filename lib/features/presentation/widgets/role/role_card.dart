import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  final String iconPath;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double checkSize = (size.width * 0.06).clamp(20.0, 28.0);
    final double cardRadius = (size.width * 0.05).clamp(16.0, 20.0);

    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all((size.width * 0.04).clamp(12.0, 16.0)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cardRadius),
              border: Border.all(
                width: 1.75,
                color: isSelected
                    ? const Color(0xff006C49)
                    : const Color(0xff7B8490),
              ),
              color: isSelected
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
                    iconPath,
                    width: (size.width * 0.12).clamp(36.0, 48.0),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: (size.width * 0.05).clamp(18.0, 20.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          description,
                          softWrap: true,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: (size.width * 0.035).clamp(12.0, 14.0),
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
          if (isSelected)
            PositionedDirectional(
              top: (size.width * 0.035).clamp(10.0, 16.0),
              end: (size.width * 0.035).clamp(10.0, 16.0),
              child: Icon(
                Icons.check_circle,
                size: checkSize,
                color: const Color(0xff006C49),
              ),
            ),
        ],
      ),
    );
  }
}
