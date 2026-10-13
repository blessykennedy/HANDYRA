import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool publicProfile = true;
  bool showPhone = false;
  bool locationSharing = true;
  bool analytics = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4E0D2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Privacy & Data Controls",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text("Public Profile Visibility", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text("Allow nearby clients to view your services & portfolio"),
                      value: publicProfile,
                      activeColor: const Color(0xFFE06C20),
                      onChanged: (val) => setState(() => publicProfile = val),
                    ),
                    const Divider(),
                    SwitchListTile(
                      title: const Text("Direct Phone Contact", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text("Show phone number to unconfirmed clients"),
                      value: showPhone,
                      activeColor: const Color(0xFFE06C20),
                      onChanged: (val) => setState(() => showPhone = val),
                    ),
                    const Divider(),
                    SwitchListTile(
                      title: const Text("Live Location Tracking", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text("Enable turn-by-turn navigation & client tracking"),
                      value: locationSharing,
                      activeColor: const Color(0xFFE06C20),
                      onChanged: (val) => setState(() => locationSharing = val),
                    ),
                    const Divider(),
                    SwitchListTile(
                      title: const Text("Usage Analytics", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text("Help improve app performance with diagnostic data"),
                      value: analytics,
                      activeColor: const Color(0xFFE06C20),
                      onChanged: (val) => setState(() => analytics = val),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Privacy settings updated!")),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF654B3C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Save Privacy Settings",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
