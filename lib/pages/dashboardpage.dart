import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:record/record.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telephony/telephony.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}


class _DashboardPageState extends State<DashboardPage> {
  final Telephony telephony = Telephony.instance;
  late final Record _audioRecorder;
  // ignore: unused_field
  bool _isRecording = false;
  String? _audioPath;

  @override
void initState() {
  super.initState();
  _audioRecorder = Record(); // This is valid because Record() provides a concrete implementation.
}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb_outline), label: "Safety Tips"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map View"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushNamed(context, '/safetytips');
              break;
            case 2:
              Navigator.pushNamed(context, '/mapview');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'SurakshaBuddy',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Your Personal Safety Companion',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                    GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                      color: Colors.cyanAccent.shade100,
                      borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.notifications, color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // SOS Trigger
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFD6EFE8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: triggerSOS,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent,
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Tap to Trigger SOS",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "You're Safe",
                      style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Features Grid
              Expanded(
  child: GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    children: [
      _featureButton(Icons.mic, 'Audio Recorder', () {
        Navigator.pushNamed(context, '/audio');
      }),
      _featureButton(Icons.videocam, 'Video Recorder', () {
        Navigator.pushNamed(context, '/video');
      }),
      _featureButton(Icons.bluetooth, 'Bluetooth Alert', () {
        Navigator.pushNamed(context, '/bluetoothalert');
      }),
      _featureButton(Icons.contacts, 'Emergency Contacts', () {
        Navigator.pushNamed(context, '/emergencycontacts');
      }),
    ],
  ),
),

            ],
          ),
        ),
      ),
    );
  }

  Widget _featureButton(IconData icon, String label, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(2, 4),
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          onTap();
        },
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.blueGrey),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Future<void> triggerSOS() async {
  final statuses = await [
    Permission.location,
    Permission.microphone,
    Permission.sms,
    Permission.manageExternalStorage,
    Permission.storage,
    Permission.bluetooth,
    Permission.camera, // Add camera if needed
  ].request();
  await getApplicationDocumentsDirectory();
  // Debug: Log status of all permissions
  statuses.forEach((permission, status) {
    debugPrint("🔐 $permission: ${status.isGranted}");
  });

  // Check all permissions
  if (!statuses.values.every((status) => status.isGranted)) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ Some permissions are not granted. Please enable them in settings.")),
      );
    }
    
    return;
  }

  try {
    // 🧭 Get location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final lat = position.latitude;
    final lng = position.longitude;
    final time = DateTime.now().toIso8601String();

    // 🎙️ Start audio recording
    _audioPath = await _getAudioPath();
    await _audioRecorder.start(path: _audioPath);
    setState(() => _isRecording = true);

    // 🌐 Check network
    final connectivity = await Connectivity().checkConnectivity();
    final isOnline = connectivity != ConnectivityResult.none;

    // 📩 Send SMS
    const contacts = ['+919876543210', '+919123456789', '+919000112233'];
    final message = "🚨 Emergency! Help needed at https://maps.google.com/?q=$lat,$lng\nTime: $time\n- SurakshaBuddy";
    for (String number in contacts) {
      try {
        await telephony.sendSms(to: number, message: message);
      } catch (e) {
        debugPrint('Failed to send SMS to $number: $e');
      }
    }

    // ☁️ Upload audio if online
    if (isOnline && _audioPath != null) {
      await _audioRecorder.stop();
      setState(() => _isRecording = false);

      final audioFile = File(_audioPath!);
      final fileName = 'sos_audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await Supabase.instance.client.storage
          .from('sos-data')
          .upload('sos_audios/$fileName', audioFile);

      final audioUrl = Supabase.instance.client.storage
          .from('sos-data')
          .getPublicUrl('sos_audios/$fileName');

      final userId = Supabase.instance.client.auth.currentUser?.id;

      if (userId != null) {
        await Supabase.instance.client.from('sos_logs').insert({
          'user_id': userId,
          'location': 'https://maps.google.com/?q=$lat,$lng',
          'timestamp': time,
          'audio_url': audioUrl,
        });
      }
      debugPrint("✅ Audio URL: $audioUrl");
    }

    // ✅ Done!
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("🆘 SOS Triggered, Audio Saved & SMS Sent!")),
      );
    }
  } catch (e) {
    debugPrint('Error in triggerSOS: $e');
    setState(() => _isRecording = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("⚠️ Error: ${e.toString()}")),
      );
    }
  }
}

  Future<String> _getAudioPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/sos-logs${DateTime.now().millisecondsSinceEpoch}.m4a';
  }
}


