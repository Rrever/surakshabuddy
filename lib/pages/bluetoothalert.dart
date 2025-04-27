import 'package:flutter/material.dart';

class BluetoothAlertPage extends StatelessWidget {
  const BluetoothAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Bluetooth Alert",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.blue[50],
                    child: Icon(Icons.bluetooth, color: Colors.blue),
                  )
                ],
              ),
              const Text("Personal Safety Dashboard", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),

              // Listening Status Card
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 12, color: Colors.blue),
                        SizedBox(width: 8),
                        Text("System Status", style: TextStyle(fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text("Alert System", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Listening for SOS...",
                        style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.wifi, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text("4 devices connected", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Switch(
                        value: true,
                        onChanged: (val) {},
                        activeColor: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 24),
              Text("Signal Strength", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 1.0,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.refresh, size: 18, color: Colors.grey),
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Low", style: TextStyle(fontSize: 12)),
                  Text("Medium", style: TextStyle(fontSize: 12)),
                  Text("Strong", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue))
                ],
              ),

              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Alert History", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("View All", style: TextStyle(color: Colors.blue))
                ],
              ),
              SizedBox(height: 8),

              // Alert History Items
              Expanded(
                child: ListView(
                  children: const [
                    AlertItem(
                      icon: Icons.warning,
                      color: Colors.red,
                      title: "SOS Alert Received",
                      subtitle: "Device: Sarah's Watch • 2 min ago",
                    ),
                    AlertItem(
                      icon: Icons.bluetooth,
                      color: Colors.blue,
                      title: "New Device Connected",
                      subtitle: "Device: Mom's Phone • 15 min ago",
                    ),
                    AlertItem(
                      icon: Icons.sync,
                      color: Colors.blue,
                      title: "System Scan Complete",
                      subtitle: "4 devices found • 30 min",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlertItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const AlertItem({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withAlpha((0.1 * 255).toInt()),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}
