import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.redWhiteGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 48.h),
                // App Icon
                Container(
                  width: 88.w,
                  height: 88.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.emergencyRed.withOpacity(0.18),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.health_and_safety_rounded,
                      size: 48.sp,
                      color: AppColors.emergencyRed,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'INFOTAG',
                  style: GoogleFonts.poppins(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.navyDark,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Your Emergency Identity, Always Ready',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 14.sp,
                    color: AppColors.textMuted,
                  ),
                ),
                SizedBox(height: 36.h),

                // White Login Card
                Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: GoogleFonts.poppins(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.navyDark,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Enter your phone number to continue',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          color: AppColors.textMuted,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Phone Input
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.vibrantBlue, width: 1.5),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Row(
                                children: [
                                  Text('🇮🇳', style: TextStyle(fontSize: 20.sp)),
                                  SizedBox(width: 6.w),
                                  Text(
                                    '+91',
                                    style: GoogleFonts.nunito(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.navyDark,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Container(width: 1.w, height: 24.h, color: AppColors.vibrantBlue.withOpacity(0.3)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                style: GoogleFonts.nunito(fontSize: 14.sp, color: AppColors.navyDark),
                                decoration: InputDecoration(
                                  hintText: '(555) 000-0000',
                                  hintStyle: GoogleFonts.nunito(
                                    fontSize: 14.sp,
                                    color: AppColors.textMuted,
                                  ),
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.phone_iphone_rounded, color: AppColors.vibrantBlue, size: 20.sp),
                                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // CTA Button
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                        child: Container(
                          width: double.infinity,
                          height: 52.h,
                          decoration: BoxDecoration(
                            gradient: AppColors.bluePurpleGradient,
                            borderRadius: BorderRadius.circular(14.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.vibrantBlue.withOpacity(0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Send OTP',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(Icons.arrow_forward_rounded, color: AppColors.white, size: 20.sp),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Security Info Card
                      Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.shield_rounded, color: AppColors.successGreen, size: 22.sp),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                'Your data is encrypted and never shared without your consent',
                                style: GoogleFonts.nunito(
                                  fontSize: 12.sp,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'By continuing you agree to our Terms of Service',
                    style: GoogleFonts.nunito(
                      fontSize: 12.sp,
                      color: AppColors.textMuted,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
