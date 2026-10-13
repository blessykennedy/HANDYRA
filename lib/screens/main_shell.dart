import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/bookings.dart';
import 'bookings_page.dart';
import 'customer_profile_page.dart';
import 'explore_page.dart';
import 'home_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  static const peach = Color(0xFFF3DED0);

  int _index = 0;
  String? _service;

  @override
  void initState() {
    super.initState();
    tabRequest.addListener(_onTabRequest);
  }

  @override
  void dispose() {
    tabRequest.removeListener(_onTabRequest);
    super.dispose();
  }

  void _onTabRequest() {
    final target = tabRequest.value;
    if (target == null) return;
    setState(() {
      _service = null;
      _index = target;
    });
    tabRequest.value = null;
  }

  void _onTabTap(int i) {
    setState(() {
      if (i == 1) _service = null;
      _index = i;
    });
  }

  void _openCategory(String service) {
    setState(() {
      _service = service;
      _index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomePage(
        onOpenExplore: () => _onTabTap(1),
        onOpenCategory: _openCategory,
      ),
      ExplorePage(
        service: _service,
        onClearService: () => setState(() => _service = null),
        onBack: () => setState(() {
          _service = null;
          _index = 0;
        }),
      ),
      const BookingsPage(),
      const _ComingSoon('Messages'),
      const CustomerProfilePage(),
    ];

    return Scaffold(
      backgroundColor: peach,
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: ValueListenableBuilder<List<Booking>>(
        valueListenable: bookings,
        builder: (context, list, _) {
          final upcoming = list.where((b) => b.status == 'Upcoming').length;
          return _BottomBar(
            index: _index,
            onTap: _onTabTap,
            bookingCount: upcoming,
          );
        },
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.index,
    required this.onTap,
    required this.bookingCount,
  });

  final int index;
  final ValueChanged<int> onTap;
  final int bookingCount;

  static const brown = Color(0xFF604A3C);
  static const pink = Color(0xFFF3DED0);

  static const _items = [
    (Icons.home_outlined, Icons.home_filled, 'Home'),
    (Icons.search, Icons.search, 'Explore'),
    (Icons.shopping_bag_outlined, Icons.shopping_bag, 'Bookings'),
    (Icons.chat_bubble_outline, Icons.chat_bubble, 'Messages'),
    (Icons.account_circle_outlined, Icons.account_circle, 'Profile'),
  ];

  Widget _icon(int i, bool selected) {
    final item = _items[i];
    final icon = Icon(
      selected ? item.$2 : item.$1,
      size: 26,
      color: selected ? brown : Colors.black87,
    );
    if (i != 2 || bookingCount == 0) return icon;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        Positioned(
          right: -8,
          top: -6,
          child: Container(
            constraints: const BoxConstraints(minWidth: 17, minHeight: 17),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFE8442C),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: pink, width: 1.5),
            ),
            child: Text(
              '$bookingCount',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: pink,
        border: Border(top: BorderSide(color: brown, width: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: List.generate(_items.length, (i) {
              final selected = i == index;
              return Expanded(
                child: InkWell(
                  onTap: () => onTap(i),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _icon(i, selected),
                      const SizedBox(height: 3),
                      Text(
                        _items[i].$3,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight:
                          selected ? FontWeight.w700 : FontWeight.w500,
                          color: selected ? brown : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _ComingSoon extends StatelessWidget {
  const _ComingSoon(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title coming soon',
        style: GoogleFonts.playfairDisplay(
          fontSize: 20,
          color: const Color(0xFF604A3C),
        ),
      ),
    );
  }
}