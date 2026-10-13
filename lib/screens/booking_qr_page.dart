import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../data/bookings.dart';
import 'booking_confirmed.dart';

class BookingQrPage extends StatelessWidget {
  const BookingQrPage({
    super.key,
    required this.booking,
  });

  final Booking booking;

  static const Color brown = Color(0xFF604A3C);
  static const Color peach = Color(0xFFF3DED0);
  static const Color background = Color(0xFFFFFAF7);


  static const String upiId = 'handyra@upi';

  int get totalAmount => booking.price + 35;

  String get upiLink {
    return 'upi://pay'
        '?pa=$upiId'
        '&pn=Handyra'
        '&am=$totalAmount'
        '&cu=INR';
  }

  String get bookingId {
    return 'HYR-${booking.id.substring(booking.id.length - 6).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: brown,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'UPI Payment',
          style: GoogleFonts.inter(
            color: brown,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 15, 22, 30),
          child: Column(
            children: [
              Text(
                'Complete Your Payment',
                style: GoogleFonts.playfairDisplay(
                  color: brown,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Scan the QR code with Google Pay or any UPI app to pay securely.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.black54,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 25),


              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: peach,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Column(
                  children: [
                    Text(
                      'Amount to Pay',
                      style: GoogleFonts.inter(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '₹ $totalAmount',
                      style: GoogleFonts.inter(
                        color: brown,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),


              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(18),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: QrImageView(
                  data: upiLink,
                  version: QrVersions.auto,
                  size: 235,
                  backgroundColor: Colors.white,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                'Scan & Pay',
                style: GoogleFonts.inter(
                  color: brown,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                upiId,
                style: GoogleFonts.inter(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 25),


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                    color: peach,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: brown,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            booking.providerName,
                            style: GoogleFonts.inter(
                              color: brown,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.design_services_outlined,
                          color: brown,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            booking.serviceName,
                            style: GoogleFonts.inter(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: brown,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${formatDate(booking.date)} • ${booking.time}',
                            style: GoogleFonts.inter(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 15,
                    color: Colors.black45,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Secure UPI payment',
                    style: GoogleFonts.inter(
                      color: Colors.black54,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),


              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookingConfirmedPage(
                          booking: booking,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Payment Completed',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'After completing the payment, tap the button above.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.black45,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}