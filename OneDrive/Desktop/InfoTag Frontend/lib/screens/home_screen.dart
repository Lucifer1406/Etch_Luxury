import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/avatar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    if (index == _currentIndex) return;
    final routes = ['/home', '/my-qr', '/emergency', '/contacts', '/log'];
    final navIndex = index <= 1 ? index : index + 1;
    if (index == 2) {
      Navigator.pushNamed(context, '/emergency');
    } else {
      final targetRoutes = ['/home', '/my-qr', '/emergency', '/contacts', '/log'];
      final realIndex = index >= 3 ? index : index;
      Navigator.pushReplacementNamed(context, ['/home', '/my-qr', '/emergency', '/contacts', '/log'][index == 3 ? 3 : index == 4 ? 4 : index]);
    }
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
              SizedBox(height: 16.h),
              // Top Bar
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.emergencyRed.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'IT',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.emergencyRed,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'INFOTAG',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.emergencyRed,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none_rounded, color: AppColors.navyDark, size: 24.sp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings_outlined, color: AppColors.navyDark, size: 24.sp),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Greeting
              Text(
                'Good morning,',
                style: GoogleFonts.nunito(fontSize: 14.sp, color: AppColors.textMuted),
              ),
              Text(
                'Sarah 👋',
                style: GoogleFonts.poppins(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navyDark,
                ),
              ),
              SizedBox(height: 16.h),

              // Profile Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    AvatarWidget(initials: 'SJ', backgroundColor: AppColors.avatarPink, size: 52),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sarah Johnson',
                            style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark),
                          ),
                          Text(
                            '+1 (555) 234-5678',
                            style: GoogleFonts.nunito(fontSize: 13.sp, color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.emergencyRed,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            '🩸 O+',
                            style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.white),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.successGreen.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check_circle_rounded, color: AppColors.successGreen, size: 12.sp),
                              SizedBox(width: 4.w),
                              Text(
                                'Active',
                                style: GoogleFonts.nunito(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.successGreen),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Quick Actions
              Text('Quick Actions', style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
              SizedBox(height: 12.h),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1.3,
                children: [
                  _QuickActionCard(
                    icon: Icons.qr_code_2_rounded,
                    title: 'My QR Code',
                    subtitle: 'Scan to view info',
                    bgColor: const Color(0xFFFFF0F3),
                    iconColor: AppColors.emergencyRed,
                    onTap: () => Navigator.pushNamed(context, '/my-qr'),
                  ),
                  _QuickActionCard(
                    icon: Icons.crisis_alert_rounded,
                    title: 'SOS Emergency',
                    subtitle: 'Alert contacts now',
                    bgColor: const Color(0xFFFDF0EE),
                    iconColor: AppColors.emergencyRed,
                    onTap: () => Navigator.pushNamed(context, '/emergency'),
                  ),
                  _QuickActionCard(
                    icon: Icons.people_alt_rounded,
                    title: 'Contacts',
                    subtitle: '3 contacts added',
                    bgColor: const Color(0xFFEFF6FF),
                    iconColor: AppColors.vibrantBlue,
                    onTap: () => Navigator.pushNamed(context, '/contacts'),
                  ),
                  _QuickActionCard(
                    icon: Icons.history_rounded,
                    title: 'Activity Log',
                    subtitle: 'Last: 2 hours ago',
                    bgColor: const Color(0xFFF5F0FF),
                    iconColor: AppColors.purple,
                    onTap: () => Navigator.pushNamed(context, '/log'),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Emergency Contacts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Emergency Contacts', style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/contacts'),
                    child: Text('View all ›', style: GoogleFonts.nunito(fontSize: 13.sp, color: AppColors.vibrantBlue, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              _ContactMiniCard(initials: 'MJ', name: 'Michael Johnson', role: 'Husband', bgColor: AppColors.avatarPink),
              SizedBox(height: 8.h),
              _ContactMiniCard(initials: 'PM', name: 'Dr. Priya Mehta', role: 'Primary Doctor', bgColor: AppColors.avatarBlue),
              SizedBox(height: 24.h),

              // Recent Activity
              Text('Recent Activity', style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
              SizedBox(height: 12.h),
              _ActivityItem(icon: Icons.qr_code_2_rounded, title: 'QR Scanned', subtitle: "St. Mary's Hospital", time: 'Today, 2:34 PM', color: AppColors.vibrantBlue),
              SizedBox(height: 8.h),
              _ActivityItem(icon: Icons.crisis_alert_rounded, title: 'SOS Triggered', subtitle: 'Midtown, New York', time: 'Yesterday, 11:20 AM', color: AppColors.emergencyRed),
              SizedBox(height: 90.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (i) {
          final routes = ['/home', '/my-qr', '/emergency', '/contacts', '/log'];
          if (i != 0) Navigator.pushReplacementNamed(context, routes[i]);
        },
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon, required this.title, required this.subtitle,
    required this.bgColor, required this.iconColor, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28.sp, color: iconColor),
            SizedBox(height: 8.h),
            Text(title, style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w700, color: AppColors.navyDark)),
            Text(subtitle, style: GoogleFonts.nunito(fontSize: 11.sp, color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }
}

class _ContactMiniCard extends StatelessWidget {
  final String initials;
  final String name;
  final String role;
  final Color bgColor;

  const _ContactMiniCard({required this.initials, required this.name, required this.role, required this.bgColor});

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
          AvatarWidget(initials: initials, backgroundColor: bgColor, size: 42),
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
            decoration: BoxDecoration(color: AppColors.successGreen, borderRadius: BorderRadius.circular(10.r)),
            child: Icon(Icons.phone_rounded, color: AppColors.white, size: 18.sp),
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const _ActivityItem({required this.icon, required this.title, required this.subtitle, required this.time, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(10.r)),
            child: Icon(icon, color: color, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.navyDark)),
                Text(subtitle, style: GoogleFonts.nunito(fontSize: 12.sp, color: AppColors.textMuted)),
              ],
            ),
          ),
          Text(time, style: GoogleFonts.nunito(fontSize: 11.sp, color: AppColors.textMuted)),
        ],
      ),
    );
  }
}
