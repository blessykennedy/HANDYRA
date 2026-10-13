import 'package:flutter/material.dart';

class TransactionDetailScreen extends StatelessWidget {
  final String bookingId;
  final String name;
  final String service;
  final String amount;
  final String date;
  final String status;

  const TransactionDetailScreen({
    super.key,
    this.bookingId = '#BK001',
    this.name = 'Daffne',
    this.service = 'Bridal Makeup',
    this.amount = '₹3,150',
    this.date = 'Dec 15, 2024',
    this.status = 'Paid',
  });

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
        title: Text(
          "Transaction $bookingId",
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 50),
                    const SizedBox(height: 10),
                    Text(
                      amount,
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF654B3C)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Payment Status: $status",
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const Divider(height: 30),
                    _detailRow("Booking ID", bookingId),
                    _detailRow("Client Name", name),
                    _detailRow("Service", service),
                    _detailRow("Service Date", date),
                    _detailRow("Gross Service Fee", "₹3,500"),
                    _detailRow("Platform Fee (10%)", "-₹350"),
                    _detailRow("Net Earnings", amount, isBold: true),
                    _detailRow("Payout Method", "Bank Transfer (HDFC ****4521)"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Downloading PDF Invoice...")),
                    );
                  },
                  icon: const Icon(Icons.download, color: Colors.white),
                  label: const Text("Download Invoice PDF", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF654B3C),
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

  static Widget _detailRow(String title, String val, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(
            val,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? const Color(0xFF654B3C) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
