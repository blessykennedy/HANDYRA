import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/bookings.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({
    super.key,
    required this.booking,
  });

  final Booking booking;

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  static const Color brown = Color(0xFF604A3C);
  static const Color peach = Color(0xFFF3DED0);
  static const Color background = Color(0xFFFFFAF7);

  Timer? _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          _now = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  DateTime _bookingStart() {
    final timeParts = widget.booking.time.trim().split(' ');

    final hourMinute = timeParts[0].split(':');

    int hour = int.parse(hourMinute[0]);
    final minute = int.parse(hourMinute[1]);

    final period =
    timeParts.length > 1 ? timeParts[1].toUpperCase() : 'AM';

    if (period == 'PM' && hour != 12) {
      hour += 12;
    }

    if (period == 'AM' && hour == 12) {
      hour = 0;
    }

    return DateTime(
      widget.booking.date.year,
      widget.booking.date.month,
      widget.booking.date.day,
      hour,
      minute,
    );
  }

  String _remainingText(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (days > 0) {
      return '$days day${days == 1 ? '' : 's'} '
          '$hours hr '
          '$minutes min';
    }

    if (hours > 0) {
      return '$hours hr $minutes min';
    }

    if (minutes > 0) {
      return '$minutes min $seconds sec';
    }

    return '$seconds sec';
  }

  String get _status {
    if (widget.booking.status == 'Cancelled') {
      return 'Cancelled';
    }

    final start = _bookingStart();

    if (_now.isBefore(start)) {
      final remaining = start.difference(_now);

      if (remaining.inMinutes < 60) {
        return 'Starting Soon';
      }

      return 'Pending';
    }

    return 'Service Started';
  }

  Color get _statusColor {
    if (_status == 'Cancelled') {
      return Colors.redAccent;
    }

    if (_status == 'Service Started') {
      return Colors.blue;
    }

    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final start = _bookingStart();
    final isFuture = _now.isBefore(start);
    final remaining = isFuture ? start.difference(_now) : Duration.zero;

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
          'Booking Details',
          style: GoogleFonts.inter(
            color: brown,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: peach,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: _statusColor.withAlpha(31),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _status,
                        style: GoogleFonts.inter(
                          color: _statusColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    if (isFuture) ...[
                      Text(
                        'Starts in',
                        style: GoogleFonts.inter(
                          color: brown,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        _remainingText(remaining),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: brown,
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        'Your service will begin at ${widget.booking.time}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ] else
                      Text(
                        'Your service has started',
                        style: GoogleFonts.inter(
                          color: brown,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              Text(
                'Booking ID',
                style: GoogleFonts.inter(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                '#HYR-${widget.booking.id.substring(widget.booking.id.length - 6)}',
                style: GoogleFonts.inter(
                  color: brown,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 22),

              Text(
                'Service Details',
                style: GoogleFonts.inter(
                  color: brown,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 12),

              _infoCard(
                icon: Icons.person_outline,
                title: 'Provider',
                value: widget.booking.providerName,
                subtitle: widget.booking.role,
              ),

              _infoCard(
                icon: Icons.design_services_outlined,
                title: 'Service',
                value: widget.booking.serviceName,
                subtitle: widget.booking.duration,
              ),

              _infoCard(
                icon: Icons.calendar_month_outlined,
                title: 'Date',
                value: formatDate(widget.booking.date),
              ),

              _infoCard(
                icon: Icons.access_time,
                title: 'Time',
                value: widget.booking.time,
              ),

              _infoCard(
                icon: Icons.location_on_outlined,
                title: 'Location',
                value: widget.booking.location,
              ),

              _infoCard(
                icon: Icons.currency_rupee,
                title: 'Service Price',
                  value: '₹ ${widget.booking.price}',
              ),

              const SizedBox(height: 10),

              if (widget.booking.status == 'Upcoming')
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Cancel booking?'),
                            content: Text(
                              'Your booking with '
                                  '${widget.booking.providerName} '
                                  'will be cancelled.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text('Keep'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text(
                                  'Cancel booking',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirm == true) {
                        cancelBooking(widget.booking.id);

                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(
                        color: Colors.redAccent,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: Text(
                      'Cancel Booking',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
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

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
    String? subtitle,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: peach,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: brown,
              size: 21,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.black54,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  value,
                  style: GoogleFonts.inter(
                    color: brown,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      color: Colors.black54,
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}