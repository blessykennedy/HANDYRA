import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/provider_details.dart';
import 'provider_profile_page.dart';

class Artist {
  const Artist({
    required this.name,
    required this.role,
    required this.service,
    required this.group,
    required this.price,
    required this.distanceKm,
    required this.rating,
  });

  final String name;
  final String role;
  final String service;
  final String group;
  final String price;
  final double distanceKm;
  final double rating;

  String get distanceText {
    final d = distanceKm % 1 == 0
        ? distanceKm.toInt().toString()
        : distanceKm.toString();
    return '$d kms away';
  }
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
    this.service,
    this.onClearService,
    this.onBack,
  });

  final String? service;
  final VoidCallback? onClearService;
  final VoidCallback? onBack;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  static const brown = Color(0xFF604A3C);
  static const peach = Color(0xFFF3DED0);
  static const mocha = Color(0xFF9C7F6E);

  static const _filters = ['All', 'Makeup', 'Hair', 'Saree', 'Nails', 'Mehandi'];
  static const maxAll = 10;

  static const _artists = [
    Artist(
      name: 'Meena',
      role: 'Saree Pre-pleating Expert',
      service: 'Saree pre-pleating',
      group: 'Saree',
      price: '₹ 300 -600',
      distanceKm: 1.2,
      rating: 4.6,
    ),
    Artist(
      name: 'Sangeetha',
      role: 'Saree Pre-pleating Expert',
      service: 'Saree pre-pleating',
      group: 'Saree',
      price: '₹ 250 -500',
      distanceKm: 3.8,
      rating: 4.2,
    ),
    Artist(
      name: 'Radha',
      role: 'Saree Pre-pleating Expert',
      service: 'Saree pre-pleating',
      group: 'Saree',
      price: '₹ 200 -450',
      distanceKm: 7.5,
      rating: 3.9,
    ),
    Artist(
      name: 'Divya',
      role: 'Saree Draping Expert',
      service: 'Saree Draping',
      group: 'Saree',
      price: '₹ 800 -1,000',
      distanceKm: 2.5,
      rating: 4.5,
    ),
    Artist(
      name: 'Pooja',
      role: 'Saree Draping Expert',
      service: 'Saree Draping',
      group: 'Saree',
      price: '₹ 600 -1,200',
      distanceKm: 6.1,
      rating: 4.1,
    ),
    Artist(
      name: 'Priya',
      role: 'Bridal Makeup Artist',
      service: 'Makeup',
      group: 'Makeup',
      price: '₹ 5,000-10,000',
      distanceKm: 2.3,
      rating: 4,
    ),
    Artist(
      name: 'Anjali',
      role: 'Makeup Artist',
      service: 'Makeup',
      group: 'Makeup',
      price: '₹ 3000 -8,000',
      distanceKm: 5.4,
      rating: 4.3,
    ),
    Artist(
      name: 'Keerthika',
      role: 'Hair Stylist',
      service: 'Hairstyle',
      group: 'Hair',
      price: '₹ 4000 - 10000',
      distanceKm: 4,
      rating: 3.5,
    ),
    Artist(
      name: 'Sneha',
      role: 'Hair Stylist',
      service: 'Hairstyle',
      group: 'Hair',
      price: '₹ 1,200 -3,500',
      distanceKm: 7.2,
      rating: 4.4,
    ),
    Artist(
      name: 'Lakshmi',
      role: 'Mehandi Artist',
      service: 'Mehandi',
      group: 'Mehandi',
      price: '₹ 500 -2,000',
      distanceKm: 1.8,
      rating: 4.7,
    ),
    Artist(
      name: 'Revathi',
      role: 'Mehandi Artist',
      service: 'Mehandi',
      group: 'Mehandi',
      price: '₹ 700 -2,500',
      distanceKm: 6.5,
      rating: 4,
    ),
    Artist(
      name: 'Nisha',
      role: 'Nail Artist',
      service: 'Nail Art',
      group: 'Nails',
      price: '₹ 900 -2,500',
      distanceKm: 2.9,
      rating: 4.2,
    ),
    Artist(
      name: 'Kavitha',
      role: 'Nail Artist',
      service: 'Nail Art',
      group: 'Nails',
      price: '₹ 1200 -4000',
      distanceKm: 5,
      rating: 4.8,
    ),
  ];

  String _filter = 'All';
  String _query = '';

  List<Artist> get _visible {
    final q = _query.toLowerCase().trim();
    final selectedService = widget.service;

    final list = _artists.where((a) {
      final byService = selectedService != null
          ? a.service == selectedService
          : (_filter == 'All' || a.group == _filter);
      final byQuery = q.isEmpty ||
          a.name.toLowerCase().contains(q) ||
          a.role.toLowerCase().contains(q) ||
          a.service.toLowerCase().contains(q);
      return byService && byQuery;
    }).toList()
      ..sort((a, b) => a.distanceKm.compareTo(b.distanceKm));

    final showingAll = selectedService == null && _filter == 'All' && q.isEmpty;
    return showingAll ? list.take(maxAll).toList() : list;
  }

  @override
  Widget build(BuildContext context) {
    final list = _visible;
    final service = widget.service;

    return Container(
      color: peach,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                color: Colors.black,
                onPressed: widget.onBack,
              ),
              Text(
                'Explore Services',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: brown,
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                onChanged: (v) => setState(() => _query = v),
                style: GoogleFonts.inter(fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'Search services , artists',
                  hintStyle: GoogleFonts.playfairDisplay(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: mocha,
                  ),
                  prefixIcon: const Icon(Icons.search, color: mocha),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: brown, width: 0.8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: brown, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 32,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _filters.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 10),
                    itemBuilder: (context, i) {
                      final f = _filters[i];
                      final selected = service == null && f == _filter;
                      return GestureDetector(
                        onTap: () {
                          widget.onClearService?.call();
                          setState(() => _filter = f);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected ? brown : const Color(0xFF8B7262),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            f,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFF5F0E8),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  if (service != null) ...[
                    GestureDetector(
                      onTap: widget.onClearService,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: brown, width: 0.8),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              service,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: brown,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.close, size: 14, color: brown),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                  Text(
                    '${list.length} providers · nearest first',
                    style: GoogleFonts.inter(fontSize: 11, color: mocha),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: list.isEmpty
                    ? Center(
                  child: Text(
                    'No artists found',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      color: mocha,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: list.length,
                  itemBuilder: (context, i) =>
                      _ArtistCard(artist: list[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArtistCard extends StatelessWidget {
  const _ArtistCard({required this.artist});

  final Artist artist;

  static const brown = Color(0xFF604A3C);
  static const starColor = Color(0xFFE8442C);

  String get _ratingText => artist.rating % 1 == 0
      ? artist.rating.toInt().toString()
      : artist.rating.toString();

  Widget _stars() {
    final full = artist.rating.floor();
    final half = (artist.rating - full) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        IconData icon;
        if (i < full) {
          icon = Icons.star;
        } else if (i == full && half) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(icon, size: 18, color: starColor);
      }),
    );
  }

  void _openProfile(BuildContext context) {
    final details = providerDetails[artist.name];
    if (details == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${artist.name} profile coming soon')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProviderProfilePage(details: details),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: brown, width: 0.8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 28,
                      color: Color(0xFF8B7262),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        artist.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: brown,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  artist.role,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  artist.price,
                  style: GoogleFonts.inter(fontSize: 11, color: Colors.black87),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 15),
                    const SizedBox(width: 4),
                    Text(
                      artist.distanceText,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    _ratingText,
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'ratings',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              _stars(),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => _openProfile(context),
                child: Container(
                  width: 92,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: brown,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'View',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: const Color(0xFFF5F0E8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}