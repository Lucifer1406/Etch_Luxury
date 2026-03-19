import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/avatar_widget.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  bool _isHolding = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

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
              Text('Emergency SOS', style: GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
              SizedBox(height: 4.h),
              Text('Press and hold the button to send emergency alert', style: GoogleFonts.nunito(fontSize: 13.sp, color: AppColors.textMuted)),
              SizedBox(height: 40.h),

              // Pulsing SOS Button
              Center(
                child: AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (_, __) => Transform.scale(
                    scale: _pulseAnimation.value,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer glow ring
                        Container(
                          width: 180.w,
                          height: 180.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.emergencyRed.withOpacity(0.15),
                          ),
                        ),
                        // Middle ring
                        Container(
                          width: 150.w,
                          height: 150.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.emergencyRed.withOpacity(0.25),
                          ),
                        ),
                        // SOS Button
                        GestureDetector(
                          onLongPressStart: (_) => setState(() => _isHolding = true),
                          onLongPressEnd: (_) {
                            setState(() => _isHolding = false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('SOS Alert Sent! Emergency contacts have been notified.', style: GoogleFonts.nunito(fontSize: 14.sp)),
                                backgroundColor: AppColors.emergencyRed,
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          },
                          child: Container(
                            width: 120.w,
                            height: 120.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _isHolding ? const Color(0xFFB71C1C) : AppColors.emergencyRed,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.emergencyRed.withOpacity(0.5),
                                  blurRadius: 24,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'SOS',
                                  style: GoogleFonts.poppins(fontSize: 28.sp, fontWeight: FontWeight.w900, color: AppColors.white),
                                ),
                                Text(
                                  'HOLD 3s',
                                  style: GoogleFonts.nunito(fontSize: 11.sp, color: AppColors.white.withOpacity(0.85), fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              // Location Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(color: AppColors.successGreen.withOpacity(0.12), borderRadius: BorderRadius.circular(12.r)),
                      child: Icon(Icons.location_on_rounded, color: AppColors.successGreen, size: 22.sp),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('📍 Location Sharing', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
                            ],
                          ),
                          Text('Enabled — Midtown, New York City', style: GoogleFonts.nunito(fontSize: 12.sp, color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: const BoxDecoration(color: AppColors.successGreen, shape: BoxShape.circle),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              Text('Will notify', style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
              SizedBox(height: 12.h),

              _NotifyContact(initials: 'MJ', name: 'Michael Johnson', role: 'Husband', bgColor: AppColors.avatarPink),
              SizedBox(height: 8.h),
              _NotifyContact(initials: 'PM', name: 'Dr. Priya Mehta', role: 'Primary Doctor', bgColor: AppColors.avatarBlue),
              SizedBox(height: 8.h),
              _NotifyContact(initials: 'LR', name: 'Linda Reyes', role: 'Sister', bgColor: AppColors.avatarTeal),
              SizedBox(height: 90.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (i) {
          final routes = ['/home', '/my-qr', '/emergency', '/contacts', '/log'];
          if (i != 2) Navigator.pushReplacementNamed(context, routes[i]);
        },
      ),
    );
  }
}

class _NotifyContact extends StatelessWidget {
  final String initials;
  final String name;
  final String role;
  final Color bgColor;

  const _NotifyContact({required this.initials, required this.name, required this.role, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          AvatarWidget(initials: initials, backgroundColor: bgColor, size: 44),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.navyDark)),
                Text(role, style: GoogleFonts.nunito(fontSize: 12.sp, color: AppColors.textMuted)),
              ],
            ),
          ),
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(color: AppColors.emergencyRed.withOpacity(0.1), borderRadius: BorderRadius.circular(10.r)),
            child: Icon(Icons.phone_rounded, color: AppColors.emergencyRed, size: 18.sp),
          ),
        ],
      ),
    );
  }
}
