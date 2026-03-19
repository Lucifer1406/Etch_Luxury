import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_colors.dart';
import 'core/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/my_qr_screen.dart';
import 'screens/emergency_screen.dart';
import 'screens/contacts_screen.dart';
import 'screens/activity_log_screen.dart';

void main() {
  runApp(const InfoTagApp());
}

class InfoTagApp extends StatelessWidget {
  const InfoTagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'INFOTAG',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: '/login',
          onGenerateRoute: (settings) {
            Widget screen;
            switch (settings.name) {
              case '/login':
                screen = const LoginScreen();
                break;
              case '/home':
                screen = const HomeScreen();
                break;
              case '/my-qr':
                screen = const MyQrScreen();
                break;
              case '/emergency':
                screen = const EmergencyScreen();
                break;
              case '/contacts':
                screen = const ContactsScreen();
                break;
              case '/log':
                screen = const ActivityLogScreen();
                break;
              default:
                screen = const LoginScreen();
            }
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => screen,
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          },
        );
      },
    );
  }
}
