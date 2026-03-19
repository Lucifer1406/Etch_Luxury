import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/avatar_widget.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Emergency Contacts', style: GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(gradient: AppColors.bluePurpleGradient, borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_rounded, color: AppColors.white, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text('Add', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Contact 1 — Primary (with star banner)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4))],
                ),
                child: Column(
                  children: [
                    // Star Banner
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBE6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text('⭐', style: TextStyle(fontSize: 14)),
                          SizedBox(width: 6.w),
                          Text(
                            'Primary contact — notified first in emergencies',
                            style: GoogleFonts.nunito(fontSize: 12.sp, fontWeight: FontWeight.w700, color: const Color(0xFF856404)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: _ContactRow(
                        initials: 'MJ', name: 'Michael Johnson', relationship: 'Husband',
                        phone: '+1 (555) 100-2020', bgColor: AppColors.avatarPink,
                        badgeColor: const Color(0xFFFFE0EB), badgeTextColor: const Color(0xFFBF0000),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // Contact 2
              _ContactCard(
                initials: 'PM', name: 'Dr. Priya Mehta', relationship: 'Primary Doctor',
                phone: '+1 (555) 350-9876', bgColor: AppColors.avatarBlue,
                badgeColor: const Color(0xFFDCEFFB), badgeTextColor: AppColors.vibrantBlue,
              ),
              SizedBox(height: 12.h),

              // Contact 3
              _ContactCard(
                initials: 'LR', name: 'Linda Reyes', relationship: 'Sister',
                phone: '+1 (555) 420-1122', bgColor: AppColors.avatarTeal,
                badgeColor: const Color(0xFFD4F4EE), badgeTextColor: const Color(0xFF0D6E59),
              ),
              SizedBox(height: 20.h),

              // Info Box
              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.vibrantBlue.withOpacity(0.2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline_rounded, color: AppColors.vibrantBlue, size: 20.sp),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'Your emergency contacts will receive a call and SMS alert with your last known location when SOS is triggered or your QR is scanned.',
                        style: GoogleFonts.nunito(fontSize: 12.sp, color: AppColors.textMuted, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 90.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: (i) {
          final routes = ['/home', '/my-qr', '/emergency', '/contacts', '/log'];
          if (i != 3) Navigator.pushReplacementNamed(context, routes[i]);
        },
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String initials;
  final String name;
  final String relationship;
  final String phone;
  final Color bgColor;
  final Color badgeColor;
  final Color badgeTextColor;

  const _ContactRow({
    required this.initials, required this.name, required this.relationship,
    required this.phone, required this.bgColor, required this.badgeColor,
    required this.badgeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarWidget(initials: initials, backgroundColor: bgColor, size: 48),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
              SizedBox(height: 3.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(6.r)),
                child: Text(relationship, style: GoogleFonts.nunito(fontSize: 11.sp, fontWeight: FontWeight.w700, color: badgeTextColor)),
              ),
              SizedBox(height: 3.h),
              Text(phone, style: GoogleFonts.nunito(fontSize: 12.sp, color: AppColors.textMuted)),
            ],
          ),
        ),
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(color: AppColors.successGreen, borderRadius: BorderRadius.circular(10.r)),
          child: Icon(Icons.phone_rounded, color: AppColors.white, size: 18.sp),
        ),
        SizedBox(width: 6.w),
        Icon(Icons.edit_outlined, color: AppColors.textMuted, size: 20.sp),
        SizedBox(width: 6.w),
        Icon(Icons.delete_outline_rounded, color: AppColors.emergencyRed, size: 20.sp),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  final String initials;
  final String name;
  final String relationship;
  final String phone;
  final Color bgColor;
  final Color badgeColor;
  final Color badgeTextColor;

  const _ContactCard({
    required this.initials, required this.name, required this.relationship,
    required this.phone, required this.bgColor, required this.badgeColor,
    required this.badgeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4))],
      ),
      child: _ContactRow(
        initials: initials, name: name, relationship: relationship,
        phone: phone, bgColor: bgColor, badgeColor: badgeColor, badgeTextColor: badgeTextColor,
      ),
    );
  }
}
