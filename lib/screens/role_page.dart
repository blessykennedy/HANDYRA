import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  static const brown = Color(0xFF604A3C);
  static const peach = Color(0xFFF3DED0);
  static const cream = Color(0xFFF5F0E8);
  static const mocha = Color(0xFF9C7F6E);
  static const blush = Color(0xFFF0DCDF);
  static const ink = Color(0xFF3E2F26);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final ovalW = w * 0.72;

    return Scaffold(
      backgroundColor: peach,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                width: ovalW,
                height: ovalW * 0.58,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: blush,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(ovalW / 2, ovalW * 0.29),
                  ),
                  border: Border.all(color: brown, width: 0.8),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'HANDYRA',
                      style: GoogleFonts.inter(
                        fontSize: 38,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 8,
                        color: brown,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'Skilled People.Right When you Need Them.',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: mocha,
                ),
              ),
              const SizedBox(height: 26),
              Text(
                'CHOOSE YOUR EXPERIENCE',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  color: const Color(0xFF8A6F5E),
                ),
              ),
              const SizedBox(height: 36),
              _RoleCard(
                title: 'CUSTOMER',
                titleSize: 32,
                subtitle: 'Find & book skilled\nprofessionals near you',
                icon: Icons.person,
                iconBg: Colors.black,
                iconColor: Colors.white,
                onTap: () => Navigator.pushNamed(context, '/intro'),
              ),
              const SizedBox(height: 42),
              _RoleCard(
                title: 'SERVICE PROVIDER',
                titleSize: 25,
                subtitle: 'Receive bookings &\ngrow your business',
                icon: Icons.volunteer_activism,
                iconBg: const Color(0xFFD9D9D9),
                iconColor: Colors.black,
                onTap: () => Navigator.pushNamed(context, '/provider'),
              ),
              const SizedBox(height: 56),
              Text(
                '©2024 Handyra Technologies Pvt.Ltd.',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: mocha,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.title,
    required this.titleSize,
    required this.subtitle,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.onTap,
  });

  final String title;
  final double titleSize;
  final String subtitle;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: RolePage.cream,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: RolePage.brown, width: 0.8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x66000000),
              blurRadius: 8,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 39,
              backgroundColor: iconBg,
              child: Icon(icon, color: iconColor, size: 46),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: titleSize,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        color: RolePage.brown,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 13,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: RolePage.ink,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: RolePage.brown, size: 30),
          ],
        ),
      ),
    );
  }
}