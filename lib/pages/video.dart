import 'package:flutter/material.dart';

class VideoRecorderPage extends StatelessWidget {
  const VideoRecorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Video Recorder",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Top controls (flash, timer, camera)
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.flash_on, color: Colors.cyan),
                    const Text(
                      "00:32",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.camera_alt_outlined, color: Colors.cyan),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Video preview box
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      const Positioned(
                        top: 8,
                        left: 8,
                        child: Row(
                          children: [
                            Icon(Icons.fiber_manual_record,
                                color: Colors.red, size: 16),
                            SizedBox(width: 5),
                            Text(
                              "REC",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: 8,
                        right: 8,
                        child: Text(
                          "1080p • 30fps",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Recording status
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.fiber_manual_record, color: Colors.red, size: 14),
                    SizedBox(width: 8),
                    Text(
                      "Recording...",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Bottom navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.image, size: 28, color: Colors.cyan),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent,
                          blurRadius: 20,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: const Icon(Icons.stop, color: Colors.white, size: 32),
                  ),
                  Icon(Icons.settings, size: 28, color: Colors.cyan),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
