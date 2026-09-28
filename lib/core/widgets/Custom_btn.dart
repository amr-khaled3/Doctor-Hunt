import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_theme/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final void Function()? onPress;
  final double textSize;
  final bool isLoading;
  const CustomBtn({
    super.key,
    required this.title,
    this.onPress,
    required this.textSize,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        enableFeedback: false,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPress,
      child: AnimatedCrossFade(
        firstChild: isLoading
            ? Text(
                title,
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  fontSize: textSize,
                  color: Colors.white,
                ),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    title,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      fontSize: textSize,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
        secondChild: SizedBox(
          width: 60,
          child: CupertinoActivityIndicator(color: CupertinoColors.white),
        ),
        duration: Duration(milliseconds: 100),
        crossFadeState: isLoading
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
      ),
    );
  }
}
