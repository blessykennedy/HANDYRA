import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.onOpenExplore,
    required this.onOpenCategory,
  });

  final VoidCallback onOpenExplore;
  final ValueChanged<String> onOpenCategory;

  static const brown = Color(0xFF604A3C);
  static const peach = Color(0xFFF3DED0);
  static const mocha = Color(0xFF9C7F6E);
  static const blush = Color(0xFFE8C9B8);

  static const userName = 'Monica';
  static const location = 'South Chennai , Chennai';

  static const categories = [
    ('Saree pre-pleating', 'assets/images/prepleating.png'),
    ('Saree Draping', 'assets/images/saree.png'),
    ('Makeup', 'assets/images/makeup.png'),
    ('Hairstyle', 'assets/images/hairstyle.png'),
    ('Mehandi', 'assets/images/mehandi.png'),
    ('Nail Art', 'assets/images/nailart.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: peach,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _header(context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
              child: Text(
                'Categories',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: brown,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, i) => _CategoryCard(
                  label: categories[i].$1,
                  imagePath: categories[i].$2,
                  onTap: () => onOpenCategory(categories[i].$1),
                ),
                childCount: categories.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 22,
                mainAxisExtent: 235,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      color: brown,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 18,
        20,
        22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 11,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      userName,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.notifications, color: Colors.white, size: 26),
            ],
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: onOpenExplore,
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: peach,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: mocha, size: 22),
                  const SizedBox(width: 12),
                  Text(
                    'Search services , artists',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: mocha,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.label,
    required this.imagePath,
    required this.onTap,
  });

  final String label;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: HomePage.brown, width: 0.8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  cacheWidth: 500,
                  errorBuilder: (context, error, stack) => Container(
                    color: HomePage.blush,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Missing: ${imagePath.split('/').last}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        color: HomePage.mocha,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}