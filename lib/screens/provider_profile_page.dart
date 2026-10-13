import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/provider_details.dart';
import 'select_service.dart';

class ProviderProfilePage extends StatefulWidget {
  const ProviderProfilePage({super.key, required this.details});

  final ProviderDetails details;

  @override
  State<ProviderProfilePage> createState() => _ProviderProfilePageState();
}

class _ProviderProfilePageState extends State<ProviderProfilePage> {
  static const brown = Color(0xFF604A3C);
  static const peach = Color(0xFFF3DED0);
  static const mocha = Color(0xFF9C7F6E);
  static const blush = Color(0xFFE8C9B8);
  static const ink = Color(0xFF3E2F26);
  static const green = Color(0xFF4C8C2B);
  static const red = Color(0xFFB3382C);

  int _selected = 0;

  ProviderDetails get d => widget.details;

  void _book() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectService(details: d, initialIndex: _selected),
      ),
    );
  }

  Widget _stat(String value, String label, {Color? color}) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: color ?? Colors.black,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 11, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _heading(String text, double size) {
    return Text(
      text,
      style: GoogleFonts.playfairDisplay(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: ink,
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.chat_bubble, color: brown, size: 28),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: _book,
                child: Container(
                  height: 46,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: brown,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Book Now -  ₹ ${formatPrice(d.services[_selected].price)}',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFF5F0E8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      bottomNavigationBar: _bottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_new,
                            size: 16,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Back',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B7262),
                      shape: BoxShape.circle,
                      border: Border.all(color: brown, width: 2),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 44,
                      color: Color(0xFFD9C3B3),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _heading(d.name, 22),
                        Text(
                          d.role,
                          style: GoogleFonts.inter(
                            fontSize: 10.5,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(Icons.location_on, color: brown, size: 28),
                      Text(
                        d.location,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: ink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: brown, width: 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _stat(d.experience, 'Experience'),
                    _stat(d.bookings, 'Bookings'),
                    _stat(
                      d.available ? 'Available' : 'Busy',
                      'Status',
                      color: d.available ? green : red,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              _heading('About', 20),
              const SizedBox(height: 6),
              Text(
                d.about,
                style: GoogleFonts.inter(
                  fontSize: 12.5,
                  height: 1.35,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 18),
              _heading('Services & Pricing', 13),
              const SizedBox(height: 12),
              ...List.generate(d.services.length, (i) {
                final selected = i == _selected;
                return GestureDetector(
                  onTap: () => setState(() => _selected = i),
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: selected ? brown : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          d.services[i].name,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '₹ ${formatPrice(d.services[i].price)}',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              if (d.portfolio.isNotEmpty) ...[
                const SizedBox(height: 4),
                _heading('Portfolio', 13),
                const SizedBox(height: 12),
                Row(
                  children: List.generate(d.portfolio.length, (i) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: i == d.portfolio.length - 1 ? 0 : 12,
                        ),
                        child: AspectRatio(
                          aspectRatio: 0.66,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              d.portfolio[i],
                              fit: BoxFit.cover,
                              cacheWidth: 400,
                              errorBuilder: (context, error, stack) =>
                                  Container(
                                    color: blush,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      'Missing: ${d.portfolio[i].split('/').last}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 9,
                                        color: mocha,
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}