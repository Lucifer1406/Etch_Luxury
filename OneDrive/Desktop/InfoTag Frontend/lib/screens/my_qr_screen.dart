import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/avatar_widget.dart';

class MyQrScreen extends StatelessWidget {
  const MyQrScreen({super.key});

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
              Text('My INFOTAG QR', style: GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
              SizedBox(height: 4.h),
              Text(
                'Anyone who scans this can reach your emergency contacts',
                style: GoogleFonts.nunito(fontSize: 13.sp, color: AppColors.textMuted),
              ),
              SizedBox(height: 20.h),

              // QR Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 20, offset: const Offset(0, 6))],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AvatarWidget(initials: 'SJ', backgroundColor: AppColors.avatarPink, size: 48),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sarah Johnson', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
                              Row(
                                children: [
                                  _InfoChip(label: '🩸 O+', color: AppColors.emergencyRed),
                                  SizedBox(width: 6.w),
                                  _InfoChip(label: 'Age 32', color: AppColors.vibrantBlue),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.refresh_rounded, color: AppColors.textMuted, size: 22.sp),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // QR Code
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: AppColors.lightGrey, width: 2),
                      ),
                      child: QrImageView(
                        data: 'https://infotag.app/profile/USR-SJ-2024-78291',
                        version: QrVersions.auto,
                        size: 200.w,
                        eyeStyle: QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: AppColors.navyDark,
                        ),
                        dataModuleStyle: QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.square,
                          color: AppColors.navyDark,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Shield Badge
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.navyDark,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.shield_rounded, color: AppColors.white, size: 14.sp),
                          SizedBox(width: 6.w),
                          Text('USR-SJ-2024-78291', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.white)),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Scan this QR code to access Sarah Johnson's emergency profile",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(fontSize: 12.sp, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // Stats Row
              Row(
                children: [
                  _StatBox(value: '3', label: 'Total Scans', icon: Icons.visibility_rounded, color: AppColors.vibrantBlue),
                  SizedBox(width: 8.w),
                  _StatBox(value: '2h ago', label: 'Last Scanned', icon: Icons.access_time_rounded, color: AppColors.purple),
                  SizedBox(width: 8.w),
                  _StatBox(value: 'Active', label: 'Status', icon: Icons.shield_rounded, color: AppColors.successGreen),
                ],
              ),
              SizedBox(height: 20.h),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          gradient: AppColors.bluePurpleGradient,
                          borderRadius: BorderRadius.circular(14.r),
                          boxShadow: [BoxShadow(color: AppColors.vibrantBlue.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.download_rounded, color: AppColors.white, size: 20.sp),
                            SizedBox(width: 8.w),
                            Text('Download QR', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700, color: AppColors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(color: AppColors.vibrantBlue, width: 1.5),
                    ),
                    child: Icon(Icons.share_rounded, color: AppColors.vibrantBlue, size: 22.sp),
                  ),
                ],
              ),
              SizedBox(height: 14.h),

              // Tip Card
              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBE6),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: const Color(0xFFFFE58F)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('💡', style: TextStyle(fontSize: 20.sp)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Print & Carry Your QR', style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w700, color: const Color(0xFF856404))),
                          Text('Print this QR and keep it in your wallet for emergencies when your phone isn\'t available.', style: GoogleFonts.nunito(fontSize: 12.sp, color: const Color(0xFF856404))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),

              // Preview Button
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: AppColors.vibrantBlue, width: 1.5),
                  ),
                  child: Center(
                    child: Text('Preview Public Scan Page', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.vibrantBlue)),
                  ),
                ),
              ),
              SizedBox(height: 90.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (i) {
          final routes = ['/home', '/my-qr', '/emergency', '/contacts', '/log'];
          if (i != 1) Navigator.pushReplacementNamed(context, routes[i]);
        },
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final Color color;
  const _InfoChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(6.r)),
      child: Text(label, style: GoogleFonts.nunito(fontSize: 11.sp, fontWeight: FontWeight.w700, color: color)),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  const _StatBox({required this.value, required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18.sp),
            SizedBox(height: 4.h),
            Text(value, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
            Text(label, style: GoogleFonts.nunito(fontSize: 10.sp, color: AppColors.textMuted), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
