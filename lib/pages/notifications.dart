import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Alert History',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ListView(
                  children: [
                    _buildNotificationItem(
                      icon: Icons.warning,
                      iconColor: const Color(0xFFFF3B30),
                      bgColor: const Color(0x15FF3B30),
                      title: 'SOS Alert Triggered',
                      subtitle: 'Sent from: Sarah\'s Device',
                      time: '2 min ago',
                      isUnread: true,
                    ),
                    const SizedBox(height: 12),
                    _buildNotificationItem(
                      icon: Icons.bluetooth,
                      iconColor: const Color(0xFF007AFF),
                      bgColor: const Color(0x15007AFF),
                      title: 'Device Connected',
                      subtitle: 'Bluetooth: Personal Alarm',
                      time: '15 min ago',
                      isUnread: true,
                    ),
                    const SizedBox(height: 12),
                    _buildNotificationItem(
                      icon: Icons.location_on,
                      iconColor: const Color(0xFF34C759),
                      bgColor: const Color(0x1534C759),
                      title: 'Location Shared',
                      subtitle: 'With: Emergency Contact Group',
                      time: 'Yesterday, 8:45 PM',
                    ),
                    const SizedBox(height: 12),
                    _buildNotificationItem(
                      icon: Icons.timer,
                      iconColor: const Color(0xFFFF9500),
                      bgColor: const Color(0x15FF9500),
                      title: 'Timer Completed',
                      subtitle: 'Safe Walk Timer: 15 minutes',
                      time: 'Yesterday, 7:30 PM',
                    ),
                    const SizedBox(height: 12),
                    _buildNotificationItem(
                      icon: Icons.bluetooth_disabled,
                      iconColor: const Color(0xFF007AFF),
                      bgColor: const Color(0x15007AFF),
                      title: 'Device Disconnected',
                      subtitle: 'Bluetooth: Personal Alarm',
                      time: '2 days ago',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                        debugPrint('Mark All as Read');
                        },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F5F5),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Mark All as Read',
                        style: TextStyle(color: Color(0xFF007AFF)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => debugPrint('Clear All'),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F5F5),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Clear All',
                        style: TextStyle(color: Color(0xFFFF3B30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
    required String subtitle,
    required String time,
    bool isUnread = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (isUnread)
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: iconColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 12,
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