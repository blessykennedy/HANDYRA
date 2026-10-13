import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/bookings.dart';
import '../data/provider_details.dart';
import 'booking_qr_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.provider,
    required this.service,
    required this.selectedDate,
    required this.selectedTime,
    required this.location,
    required this.totalAmount,
  });

  final ProviderDetails provider;
  final ServiceOption service;
  final DateTime selectedDate;
  final String selectedTime;
  final String location;
  final int totalAmount;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  static const Color brown = Color(0xFF604A3C);
  static const Color peach = Color(0xFFF3DED0);
  static const Color background = Color(0xFFFFFAF7);

  int selectedPayment = 0;

  final List<String> paymentMethods = [
    'UPI Payment',
    'Credit / Debit Card',
    'Net Banking',
    'Pay After Service',
  ];

  final List<IconData> paymentIcons = [
    Icons.account_balance_wallet_outlined,
    Icons.credit_card_outlined,
    Icons.account_balance_outlined,
    Icons.payments_outlined,
  ];

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
          'Payment',
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
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Choose Payment Method',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: brown,
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                paymentMethods.length,
                    (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPayment = index;
                      });
                    },

                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 14),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 17,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),

                        border: Border.all(
                          color: selectedPayment == index
                              ? brown
                              : Colors.transparent,
                          width: 1.5,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(13),
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [

                          Container(
                            width: 45,
                            height: 45,

                            decoration: BoxDecoration(
                              color: peach,
                              borderRadius:
                              BorderRadius.circular(12),
                            ),

                            child: Icon(
                              paymentIcons[index],
                              color: brown,
                              size: 23,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              paymentMethods[index],
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          Radio<int>(
                            value: index,
                            groupValue: selectedPayment,
                            activeColor: brown,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: peach,
                  borderRadius: BorderRadius.circular(17),
                ),

                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      'Total to Pay',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: brown,
                      ),
                    ),

                    Text(
                      '₹${widget.totalAmount}',
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: brown,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  onPressed: _makePayment,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    foregroundColor: Colors.white,
                    elevation: 5,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),

                  child: Text(
                    'Pay ₹${widget.totalAmount}',
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

  void _makePayment() {
    final method = paymentMethods[selectedPayment];

    showDialog(
      context: context,

      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

          title: Text(
            'Confirm Payment',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              color: brown,
            ),
          ),

          content: Text(
            'Pay ₹${widget.totalAmount} using $method?',
            style: GoogleFonts.inter(
              fontSize: 15,
            ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },

              child: Text(
                'Cancel',
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                _createBooking();
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: brown,
                foregroundColor: Colors.white,
              ),

              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _createBooking() {
    final booking = Booking(
      id: DateTime.now().microsecondsSinceEpoch.toString(),

      providerName: widget.provider.name,

      role: widget.provider.role,


      location: widget.location,

      serviceName: widget.service.name,

      duration: widget.service.duration,

      price: widget.service.price,

      date: widget.selectedDate,

      time: widget.selectedTime,

      status: 'Upcoming',
    );


    bookings.value = [
      booking,
      ...bookings.value,
    ];


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookingQrPage(
          booking: booking,
        ),
      ),
    );
  }
}