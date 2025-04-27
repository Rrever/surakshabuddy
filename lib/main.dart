import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// 👇 Import your pages
import 'package:surakshabuddy/pages/login.dart';
import 'package:surakshabuddy/pages/dashboardpage.dart';
import 'package:surakshabuddy/pages/signup.dart';
import 'package:surakshabuddy/pages/audio.dart';
import 'package:surakshabuddy/pages/video.dart';
import 'package:surakshabuddy/pages/profile.dart';
import 'package:surakshabuddy/pages/editprofile.dart';
import 'package:surakshabuddy/pages/emergencyinfo.dart';
import 'package:surakshabuddy/pages/contacts.dart';
import 'package:surakshabuddy/pages/bluetoothalert.dart';
import 'package:surakshabuddy/pages/safteytips.dart';
import 'package:surakshabuddy/pages/notifications.dart';
import 'package:surakshabuddy/pages/addemergencycontact.dart';
import 'package:surakshabuddy/pages/mapview.dart';

Future<void> main() async {
  // 🛑 Required before initializing Supabase
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Supabase here
  await Supabase.initialize(
    url: 'https://avexnmtzddqszldtwbih.supabase.co',        // ← Replace with your Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF2ZXhubXR6ZGRxc3psZHR3YmloIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU0NDc1MzcsImV4cCI6MjA2MTAyMzUzN30.i3GyaP4M4r5c7ysW-aQRrWQ9aarGMEmrf42P0XzcwYs',                // ← Replace with your Supabase anon/public key
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // 👈 Default page
      routes: {
        
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/dashboard': (context) => DashboardPage(),
        '/audio': (context) => AudioRecorderPage(),
        '/video': (context) => VideoRecorderPage(),
        '/profile': (context) => ProfilePage(),
        '/editprofile': (context) => EditProfilePage(),
        '/emergencyinfo': (context) => EmergencyInfoPage(),
        '/safetytips': (context) => SafetyTipsPage(),
        '/bluetoothalert': (context) => BluetoothAlertPage(),
        '/emergencycontacts': (context) => EmergencyContactPage(),
        '/notifications': (context) => NotificationPage(),
        '/addemergencycontact': (context) => EmergencyContactInfo2Widget(),
        '/mapview': (context) => SurakshaBuddyMap(),
      },
    );
  }
}
