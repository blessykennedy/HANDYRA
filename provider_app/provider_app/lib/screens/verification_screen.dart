import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
          "Verification Documents",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _docTile(
                context,
                title: "Government ID (Aadhar / PAN)",
                subtitle: "Verified on Oct 2023",
                isVerified: true,
              ),
              _docTile(
                context,
                title: "Professional Certification",
                subtitle: "Certified Makeup Artist & Hair Stylist",
                isVerified: true,
              ),
              _docTile(
                context,
                title: "Background Verification",
                subtitle: "Clear record verified by Provider Safety Team",
                isVerified: true,
              ),
              _docTile(
                context,
                title: "GST / Business License (Optional)",
                subtitle: "Not uploaded",
                isVerified: false,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Select new document to upload")),
                    );
                  },
                  icon: const Icon(Icons.upload_file, color: Colors.white),
                  label: const Text(
                    "Upload New Document",
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE06C20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _docTile(BuildContext context, {required String title, required String subtitle, required bool isVerified}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            isVerified ? Icons.verified_user : Icons.pending_actions,
            color: isVerified ? Colors.green : Colors.orange,
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isVerified ? Colors.green.shade50 : Colors.orange.shade50,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              isVerified ? "VERIFIED" : "PENDING",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isVerified ? Colors.green : Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
