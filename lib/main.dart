import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'screens/phone_login_screen.dart';
import 'screens/otp_verify_screen.dart';
import 'screens/setup_name_screen.dart';
import 'screens/voice_setup_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/active_meeting_screen.dart';
import 'screens/whisper_mode_screen.dart';
import 'screens/knowledge_base_screen.dart';
import 'screens/biometric_lock_screen.dart';
import 'screens/call_screening_screen.dart';
import 'screens/data_expiry_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/personality_screen.dart';
import 'screens/watermark_screen.dart';
import 'screens/gmail_settings_screen.dart';
import 'screens/intelligence_report_screen.dart';
import 'screens/encryption_screen.dart';
import 'screens/pin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const StandInAIApp());
}

class StandInAIApp extends StatelessWidget {
  const StandInAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StandIn AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF060810),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8B6FBF),
          secondary: Color(0xFF00E5CC),
          error: Color(0xFFE84057),
          surface: Color(0xFF0D0618),
        ),
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF060810),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (ctx) => const SplashScreen(),
        '/phone-login': (ctx) => const PhoneLoginScreen(),
        '/otp-verify': (ctx) => const OTPVerifyScreen(),
        '/setup-name': (ctx) => const SetupNameScreen(),
        '/voice-setup': (ctx) => const VoiceSetupScreen(),
        '/dashboard': (ctx) => const DashboardScreen(),
        '/active-meeting': (ctx) => const ActiveMeetingScreen(),
        '/whisper-mode': (ctx) => const WhisperModeScreen(),
        '/knowledge-base': (ctx) => const KnowledgeBaseScreen(),
        '/biometric-lock': (ctx) => const BiometricLockScreen(),
        '/call-screening': (ctx) => const CallScreeningScreen(),
        '/data-expiry': (ctx) => const DataExpiryScreen(),
        '/calendar': (ctx) => const CalendarScreen(),
        '/personality': (ctx) => const PersonalityScreen(),
        '/watermark': (ctx) => const WatermarkScreen(),
        '/gmail-settings': (ctx) => const GmailSettingsScreen(),
        '/intelligence-report': (ctx) => const IntelligenceReportScreen(),
        '/encryption': (ctx) => const EncryptionScreen(),
        '/pin': (ctx) => const PINScreen(),
      },
    );
  }
}
