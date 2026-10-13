import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  static const brown = Color(0xFF604A3C);
  static const peach = Color(0xFFF3DED0);
  static const cream = Color(0xFFF5F0E8);
  static const mocha = Color(0xFF9C7F6E);

  void _finish(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  Widget _photo(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        path,
        width: double.infinity,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Image failed: $path\n$error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: brown,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: cream,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  PageDecoration get _decoration => PageDecoration(
    pageColor: peach,
    titleTextStyle: GoogleFonts.playfairDisplay(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: brown,
    ),
    bodyTextStyle: GoogleFonts.inter(
      fontSize: 16,
      height: 1.5,
      color: mocha,
    ),
    imageFlex: 5,
    bodyFlex: 4,
    imagePadding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
    titlePadding: const EdgeInsets.only(top: 16, bottom: 12),
    contentMargin: const EdgeInsets.symmetric(horizontal: 16),
  );

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: peach,
      pages: [
        PageViewModel(
          title: 'Skilled Artists\nAt Your Doorstep',
          body:
          'Book experienced makeup artists, saree drapers, and more for any occasion.',
          image: _photo('assets/images/artist.png'),
          decoration: _decoration,
        ),
        PageViewModel(
          title: 'Find Your\nPerfect Match',
          body: 'Browse verified professionals with real reviews and portfolios.',
          image: _photo('assets/images/match.png'),
          decoration: _decoration,
        ),
        PageViewModel(
          title: 'Effortless\nBooking',
          body: 'Choose date, time and location. Pay securely. Get pampered.',
          image: _photo('assets/images/makeup.png'),
          decoration: _decoration,
        ),
      ],
      showSkipButton: true,
      skip: Text(
        'Skip',
        style: GoogleFonts.inter(color: mocha, fontWeight: FontWeight.w600),
      ),
      next: _button('Next'),
      done: _button('Find services'),
      onSkip: () => _finish(context),
      onDone: () => _finish(context),
      controlsPadding: const EdgeInsets.all(16),
      dotsDecorator: DotsDecorator(
        size: const Size.square(8),
        activeSize: const Size(22, 8),
        color: const Color(0xFFD9BFAE),
        activeColor: brown,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}