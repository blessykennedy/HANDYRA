import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFF3DED0)),
        child: Stack(
          children: [

            Positioned(
              left: 0,
              right: 0,
              top: 303,
              child: Text(
                'HANDYRA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF604A3C),
                  fontSize: 73,
                  fontFamily: 'Playfair Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Positioned(
              left: 34,
              right: 34,
              top: 362,
              child: Container(
                height: 12,
                decoration: const BoxDecoration(color: Color(0xFFD4A94C)),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 360,
              child: Text(
                'ON DEMAND SKILLED SERVICES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontFamily: 'Playfair Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 4.40,
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 474,
              child: Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/role'),
                  child: Container(
                    width: 200,
                    height: 43,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5F0E8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x4C000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 12,
                          offset: Offset(0, 8),
                          spreadRadius: 6,
                        ),
                      ],
                    ),
                    child: Text(
                      'START',
                      style: TextStyle(
                        color: const Color(0xFF604A3C),
                        fontSize: 24,
                        fontFamily: 'Playfair Display',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 4.80,
                      ),
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
}