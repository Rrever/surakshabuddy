import 'package:flutter/material.dart';

class SafetyTipsPage extends StatelessWidget {
  const SafetyTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Safety Tips',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Explore our safety guides to stay protected in various situations.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Self-Defense Tips Card
                _buildSafetyCard(
                  icon: Icons.shield,
                  iconColor: const Color(0xFF4285F4),
                  title: 'Self-Defense Tips',
                  description: 'Learn essential techniques and strategies to protect yourself in dangerous situations.',
                  buttonColor: const Color(0xFF4285F4),
                ),
                
                const SizedBox(height: 24),
                
                // Phone Safety Card
                _buildSafetyCard(
                  icon: Icons.smartphone,
                  iconColor: const Color(0xFFFBBC05),
                  title: 'Phone Safety',
                  description: 'Protect your digital privacy and secure your mobile devices from threats.',
                  buttonColor: const Color(0xFFFBBC05),
                ),
                
                const SizedBox(height: 24),
                
                // Outdoor Safety Card
                _buildSafetyCard(
                  icon: Icons.terrain,
                  iconColor: Colors.purple,
                  title: 'Outdoor Safety',
                  description: 'Stay safe while hiking, running, or exploring unfamiliar areas.',
                  buttonColor: Colors.purple,
                ),
                
                const SizedBox(height: 24),
                
                // Cab & Travel Safety Card
                _buildSafetyCard(
                  icon: Icons.local_taxi,
                  iconColor: const Color(0xFF0F9D58),
                  title: 'Cab & Travel Safety',
                  description: 'Navigate rideshares, taxis, and public transportation safely.',
                  buttonColor: const Color(0xFF0F9D58),
                ),
                
                const SizedBox(height: 24),
                
                // Home Safety Card
                _buildSafetyCard(
                  icon: Icons.home,
                  iconColor: const Color(0xFFDB4437),
                  title: 'Home Safety',
                  description: 'Secure your living space and learn home defense strategies.',
                  buttonColor: const Color(0xFFDB4437),
                ),
                
                const SizedBox(height: 24),
                
                // Emergency Guides Card
                _buildSafetyCard(
                  icon: Icons.emergency,
                  iconColor: const Color(0xFFFF6D00),
                  title: 'Emergency Guides',
                  description: 'Quick reference guides for handling different emergency scenarios.',
                  buttonColor: const Color(0xFFFF6D00),
                ),
                
                const SizedBox(height: 24),
                
                // Quote Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0x1A4285F4), Color(0x1A9C27B0)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        '"Preparation is the key to confidence in any situation."',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '- SafeGuard Team',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSafetyCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required Color buttonColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: iconColor.withAlpha((0.1 * 255).toInt()),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 40),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: buttonColor.withAlpha((0.1 * 255).toInt()),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'View Tips',
                    style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}