import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1A2B3C))),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1A2B3C),
        elevation: 0,
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.notifications_none_rounded, size: 64, color: Color(0xFFCDD5DE)),
          SizedBox(height: 16),
          Text('No notifications yet', style: TextStyle(color: Color(0xFF9AACBA), fontSize: 16, fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Text('You\'ll see job alerts and updates here', style: TextStyle(color: Color(0xFFB0BEC5), fontSize: 13)),
        ]),
      ),
    );
  }
}
