import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/provider_details.dart';
import 'payment_page.dart';

class BookingSummaryPage extends StatelessWidget {
  const BookingSummaryPage({
    super.key,
    required this.provider,
    required this.service,
    required this.selectedDate,
    required this.selectedTime,
    required this.location,
  });

  final ProviderDetails provider;
  final ServiceOption service;
  final DateTime selectedDate;
  final String selectedTime;
  final String location;

  static const Color brown = Color(0xFF604A3C);
  static const Color peach = Color(0xFFF3DED0);
  static const Color background = Color(0xFFFFFAF7);

  String get formattedDate {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    const weekdays = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];

    return '${weekdays[selectedDate.weekday - 1]}, '
        '${selectedDate.day} ${months[selectedDate.month - 1]}';
  }

  int get platformFee => 35;

  int get total => service.price + platformFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: brown,
            size: 21,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          'Booking Summary',
          style: GoogleFonts.inter(
            color: brown,
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),

        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: peach,
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(
                  children: [

                    Container(
                      width: 65,
                      height: 65,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: const Icon(
                        Icons.person,
                        size: 38,
                        color: brown,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(
                            provider.name,
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: brown,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            provider.role,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            service.name,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Text(
                'Booking Details',
                style: GoogleFonts.inter(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: brown,
                ),
              ),

              const SizedBox(height: 15),

              _detailRow(
                icon: Icons.calendar_month,
                title: 'Date',
                value: formattedDate,
              ),

              const SizedBox(height: 14),

              _detailRow(
                icon: Icons.access_time,
                title: 'Time',
                value: selectedTime,
              ),

              const SizedBox(height: 14),
              _detailRow(
                icon: Icons.location_on_outlined,
                title: 'Location',
                value: location,
              ),

              const SizedBox(height: 30),

              Text(
                'Price Details',
                style: GoogleFonts.inter(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: brown,
                ),
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(15),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    _priceRow(
                      service.name,
                      service.price,
                    ),

                    const SizedBox(height: 12),

                    _priceRow(
                      'Platform Fee',
                      platformFee,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Divider(),
                    ),

                    _priceRow(
                      'Total',
                      total,
                      isTotal: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  onPressed: () {

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PaymentPage(
                          provider: provider,
                          service: service,
                          selectedDate: selectedDate,
                          selectedTime: selectedTime,
                          location: location,
                          totalAmount: total,
                        ),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),

                  child: Text(
                    'Proceed to Payment →',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        children: [

          Container(
            width: 43,
            height: 43,

            decoration: BoxDecoration(
              color: peach,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: brown,
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
      String title,
      int amount, {
        bool isTotal = false,
      }) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      children: [

        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal
                ? FontWeight.w700
                : FontWeight.w500,
            color: isTotal
                ? brown
                : Colors.black87,
          ),
        ),

        Text(
          '₹$amount',
          style: GoogleFonts.inter(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal
                ? FontWeight.w700
                : FontWeight.w600,
            color: isTotal
                ? brown
                : Colors.black87,
          ),
        ),
      ],
    );
  }
}