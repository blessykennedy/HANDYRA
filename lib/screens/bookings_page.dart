import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/bookings.dart';
import '../data/provider_details.dart';
import 'provider_profile_page.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  static const brown = Color(0xFF604A3C);
  static const peach = Color(0xFFF3DED0);
  static const mocha = Color(0xFF9C7F6E);
  static const ink = Color(0xFF3E2F26);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: peach,
      child: SafeArea(
        bottom: false,
        child: ValueListenableBuilder<List<Booking>>(
          valueListenable: bookings,
          builder: (context, list, _) {
            final upcoming = list.where((b) => b.status == 'Upcoming').length;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'My Bookings',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ink,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$upcoming upcoming',
                    style: GoogleFonts.inter(fontSize: 12, color: mocha),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: list.isEmpty
                        ? _empty()
                        : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: list.length,
                      itemBuilder: (context, i) =>
                          _BookingCard(booking: list[i]),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _empty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.shopping_bag_outlined, size: 64, color: mocha),
          const SizedBox(height: 12),
          Text(
            'No bookings yet',
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: brown,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Book a provider from Explore',
            style: GoogleFonts.inter(fontSize: 12, color: mocha),
          ),
        ],
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  const _BookingCard({required this.booking});

  final Booking booking;

  static const brown = Color(0xFF604A3C);
  static const mocha = Color(0xFF9C7F6E);

  bool get _upcoming => booking.status == 'Upcoming';

  Widget _line(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: brown),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  void _openProvider(BuildContext context) {
    final details = providerDetails[booking.providerName];
    if (details == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProviderProfilePage(details: details)),
    );
  }

  Future<void> _confirmCancel(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel booking?'),
        content: Text(
          'Your booking with ${booking.providerName} will be cancelled.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Keep'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Cancel booking',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
    if (ok == true) cancelBooking(booking.id);
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _upcoming ? const Color(0xFF4C8C2B) : Colors.redAccent;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: brown, width: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle,
                size: 42,
                color: Color(0xFF8B7262),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.providerName,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: brown,
                      ),
                    ),
                    Text(
                      booking.role,
                      style: GoogleFonts.inter(fontSize: 11, color: mocha),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withAlpha(31),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  booking.status,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 22),
          _line(Icons.design_services_outlined,
              '${booking.serviceName}  ·  ${booking.duration}'),
          _line(Icons.calendar_month_outlined, formatDate(booking.date)),
          _line(Icons.access_time, booking.time),
          _line(Icons.location_on_outlined, booking.location),
          const SizedBox(height: 4),
          Text(
            '₹ ${formatPrice(booking.price)}',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _openProvider(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: brown,
                    side: const BorderSide(color: brown),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('View Provider'),
                ),
              ),
              if (_upcoming) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _confirmCancel(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(color: Colors.redAccent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}