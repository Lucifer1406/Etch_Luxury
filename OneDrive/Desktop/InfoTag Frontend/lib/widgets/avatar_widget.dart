import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';

class AvatarWidget extends StatelessWidget {
  final String initials;
  final Color backgroundColor;
  final double size;
  final double fontSize;

  const AvatarWidget({
    super.key,
    required this.initials,
    required this.backgroundColor,
    this.size = 48,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: GoogleFonts.poppins(
            fontSize: fontSize.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.navyDark,
          ),
        ),
      ),
    );
  }
}
