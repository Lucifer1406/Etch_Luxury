import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';

class ActivityLogScreen extends StatefulWidget {
  const ActivityLogScreen({super.key});

  @override
  State<ActivityLogScreen> createState() => _ActivityLogScreenState();
}

class _ActivityLogScreenState extends State<ActivityLogScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'QR Scans', 'SOS Alerts', 'Profile'];

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
              Text('Activity Log', style: GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
              SizedBox(height: 16.h),

              // Stats Row
              Row(
                children: [
                  _StatCard(value: '3', label: 'Total QR Scans', color: AppColors.vibrantBlue),
                  SizedBox(width: 8.w),
                  _StatCard(value: '2', label: 'SOS Events', color: AppColors.emergencyRed),
                  SizedBox(width: 8.w),
                  _StatCard(value: '5', label: 'This Month', color: AppColors.successGreen),
                ],
              ),
              SizedBox(height: 20.h),

              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_filters.length, (i) {
                    final isActive = _selectedFilter == i;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedFilter = i),
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isActive ? AppColors.emergencyRed : AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                        ),
                        child: Text(
                          _filters[i],
                          style: GoogleFonts.nunito(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: isActive ? AppColors.white : AppColors.textMuted,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 24.h),

              // Timeline
              Text('Timeline', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
              SizedBox(height: 16.h),

              _TimelineItem(
                icon: Icons.qr_code_2_rounded,
                iconColor: AppColors.vibrantBlue,
                iconBg: AppColors.vibrantBlue.withOpacity(0.12),
                title: 'QR Scanned',
                location: "St. Mary's Hospital, ER",
                time: 'Today, 2:34 PM',
                badge: 'QR',
                badgeColor: AppColors.vibrantBlue,
                chipLabel: 'Profile viewed by medical staff',
                isLast: false,
              ),
              _TimelineItem(
                icon: Icons.crisis_alert_rounded,
                iconColor: AppColors.emergencyRed,
                iconBg: AppColors.emergencyRed.withOpacity(0.12),
                title: 'SOS Triggered',
                location: 'Midtown, New York',
                time: 'Yesterday, 11:20 AM',
                badge: 'SOS',
                badgeColor: AppColors.emergencyRed,
                chipLabel: 'Emergency contacts were alerted',
                isLast: false,
              ),
              _TimelineItem(
                icon: Icons.qr_code_2_rounded,
                iconColor: AppColors.vibrantBlue,
                iconBg: AppColors.vibrantBlue.withOpacity(0.12),
                title: 'QR Scanned',
                location: 'Riverside Clinic',
                time: 'Feb 25, 9:15 AM',
                badge: 'QR',
                badgeColor: AppColors.vibrantBlue,
                chipLabel: 'Profile viewed by medical staff',
                isLast: true,
              ),
              SizedBox(height: 90.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
        onTap: (i) {
          final routes = ['/home', '/my-qr', '/emergency', '/contacts', '/log'];
          if (i != 4) Navigator.pushReplacementNamed(context, routes[i]);
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _StatCard({required this.value, required this.label, required this.color});

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
            Text(value, style: GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w800, color: color)),
            SizedBox(height: 2.h),
            Text(label, style: GoogleFonts.nunito(fontSize: 10.sp, color: AppColors.textMuted), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String location;
  final String time;
  final String badge;
  final Color badgeColor;
  final String chipLabel;
  final bool isLast;

  const _TimelineItem({
    required this.icon, required this.iconColor, required this.iconBg,
    required this.title, required this.location, required this.time,
    required this.badge, required this.badgeColor, required this.chipLabel,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline connector
        Column(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12.r)),
              child: Icon(icon, color: iconColor, size: 22.sp),
            ),
            if (!isLast)
              Container(width: 2.w, height: 60.h, color: AppColors.lightGrey),
          ],
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(title, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark))),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(6.r)),
                      child: Text(badge, style: GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w700, color: AppColors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 12.sp, color: AppColors.textMuted),
                    SizedBox(width: 4.w),
                    Text(location, style: GoogleFonts.nunito(fontSize: 12.sp, color: AppColors.textMuted)),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 12.sp, color: AppColors.textMuted),
                    SizedBox(width: 4.w),
                    Text(time, style: GoogleFonts.nunito(fontSize: 12.sp, color: AppColors.textMuted)),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: badgeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(chipLabel, style: GoogleFonts.nunito(fontSize: 11.sp, fontWeight: FontWeight.w600, color: badgeColor)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
