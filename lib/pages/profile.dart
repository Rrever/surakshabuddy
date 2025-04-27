// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _feedbackController = TextEditingController();
  double _rating = 0;
  bool _bluetoothAlert = true;
  bool _backgroundScanning = true;
  bool _locationTracking = false;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
              children: [
                IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
                onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 20),
                const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
              ),
              const SizedBox(height: 24),
              
              // User Profile Card
              _buildProfileCard(),
              const SizedBox(height: 24),
              
              // Safety Options Section
              _buildSectionCard(
              icon: Icons.shield,
              title: 'Safety Options',
              children: [
                _buildActionButton(
                icon: Icons.person_outline,
                text: 'Edit Profile',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/editprofile');
                  print('Edit Profile pressed');
                },
                ),
                _buildActionButton(
                icon: Icons.medical_services,
                text: 'View Emergency Info',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/emergencyinfo');
                  print('Emergency Info pressed');
                },
                ),
                _buildActionButton(
                icon: Icons.history,
                text: 'SOS History',
                onPressed: () => print('SOS History pressed'),
                ),
              ],
              ),
              const SizedBox(height: 24),
              
              // App Preferences Section
              _buildSectionCard(
              icon: Icons.settings,
              title: 'App Preferences',
              children: [
                _buildSwitchTile(
                value: _bluetoothAlert,
                title: 'Bluetooth Alert',
                subtitle: 'Receive alerts when Bluetooth is disconnected',
                onChanged: (value) => setState(() => _bluetoothAlert = value),
                ),
                const Divider(height: 1, thickness: 1, color: Colors.black12),
                _buildSwitchTile(
                value: _backgroundScanning,
                title: 'Background Scanning',
                subtitle: 'Allow app to scan for threats in background',
                onChanged: (value) => setState(() => _backgroundScanning = value),
                ),
                const Divider(height: 1, thickness: 1, color: Colors.black12),
                _buildSwitchTile(
                value: _locationTracking,
                title: 'Location Tracking',
                subtitle: 'Share location with emergency contacts',
                onChanged: (value) => setState(() => _locationTracking = value),
                ),
              ],
              ),
              const SizedBox(height: 24),
              
              // Feedback Section
              _buildSectionCard(
              icon: Icons.feedback,
              title: 'Feedback',
              children: [
                const Text(
                'Rate your experience with SafetyBuddy',
                style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                Center(
                child: RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 36,
                  itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) => setState(() => _rating = rating),
                ),
                ),
                const SizedBox(height: 16),
                TextField(
                controller: _feedbackController,
                decoration: InputDecoration(
                  hintText: 'Tell us how we can improve...',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.black12,
                ),
                maxLines: 4,
                minLines: 2,
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                text: 'Submit Feedback',
                onPressed: () => print('Feedback submitted'),
                ),
              ],
              ),
              const SizedBox(height: 24),
              
              // Logout Button
              SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                // Perform logout logic here
                Navigator.pushReplacementNamed(context, '/login');
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text('Logout', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC3545),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                ),
              ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFFEBEBF1),
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            child: Icon(Icons.person, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alex Johnson',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'alex.johnson@email.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '+1 (555) 123-4567',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF4E78C4)),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildActionButton({
    IconData? icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon != null 
            ? Icon(icon, color: Colors.white)
            : const SizedBox(),
        label: Text(text, style: const TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4E78C4),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required bool value,
    required String title,
    required String subtitle,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      activeColor: const Color(0xFF4E78C4),
      contentPadding: EdgeInsets.zero,
    );
  }
}