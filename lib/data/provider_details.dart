class ServiceOption {
  const ServiceOption(this.name, this.duration, this.price);

  final String name;
  final String duration;
  final int price;
}

class ProviderDetails {
  const ProviderDetails({
    required this.name,
    required this.role,
    required this.location,
    required this.experience,
    required this.bookings,
    required this.available,
    required this.about,
    required this.services,
    this.portfolio = const [],
  });

  final String name;
  final String role;
  final String location;
  final String experience;
  final String bookings;
  final bool available;
  final String about;
  final List<ServiceOption> services;
  final List<String> portfolio;
}

String formatPrice(int value) {
  final s = value.toString();
  if (s.length <= 3) return s;
  return '${s.substring(0, s.length - 3)},${s.substring(s.length - 3)}';
}

const providerDetails = <String, ProviderDetails>{


  'Priya': ProviderDetails(
    name: 'Priya',
    role: 'Bridal Makeup Artist',
    location: 'Chennai',
    experience: '5 yrs',
    bookings: '312+',
    available: true,
    about:
    'Bridal makeup artist creating elegant and comfortable looks for brides and special occasions.',
    services: [
      ServiceOption('Bridal Makeup', 'Duration - 5 hours', 10000),
      ServiceOption('Party Makeup', 'Duration - 3 hours', 7000),
      ServiceOption('Minimal Makeup', 'Duration - 2 hours', 5000),
    ],
    portfolio: [
      'assets/images/bridal_makeup4.png',
      'assets/images/bridal_makeup5.png',
      'assets/images/bridal_makeup6.png',
    ],
  ),


  'Anjali': ProviderDetails(
    name: 'Anjali',
    role: 'Makeup Artist',
    location: 'Chennai',
    experience: '3 yrs',
    bookings: '180+',
    available: true,
    about:
    'Makeup artist specializing in simple, elegant and natural looks for parties, family functions and special occasions.',
    services: [
      ServiceOption('Minimal Makeup', 'Duration - 2 hours', 3000),
      ServiceOption('Party Makeup', 'Duration - 3 hours', 5000),
      ServiceOption('Bridal Makeup', 'Duration - 5 hours', 8000),
    ],
    portfolio: [
      'assets/images/bridal_makeup1.png',
      'assets/images/bridal_makeup2.png',
      'assets/images/bridal_makeup3.png',
    ],
  ),

  // ---------------- MEENA ----------------
  'Meena': ProviderDetails(
    name: 'Meena',
    role: 'Saree Pre-pleating Expert',
    location: 'Chennai',
    experience: '4 yrs',
    bookings: '220+',
    available: true,
    about:
    'Experienced saree pre-pleating expert helping customers get their sarees perfectly prepared for weddings and special occasions.',
    services: [
      ServiceOption('Saree Pre-pleating', 'Duration -  30 minutes', 500),
      ServiceOption('Bridal Saree Pre-pleating', 'Duration - 1 hour', 800),
    ],
  ),

  // ---------------- NIVETHA ----------------
  'Radha': ProviderDetails(
    name: 'Radha',
    role: 'Saree Draping Expert',
    location: 'Chennai',
    experience: '4 yrs',
    bookings: '200+',
    available: true,
    about:
    'Saree draping expert experienced in creating neat and elegant drapes for weddings, functions and special occasions.',
    services: [
      ServiceOption('Saree Draping', 'Duration - 1 hour', 800),
      ServiceOption('Bridal Saree Draping', 'Duration - 2 hours', 1000),
    ],
  ),

  // ---------------- POOJA ----------------
  'Pooja': ProviderDetails(
    name: 'Pooja',
    role: 'Saree Draping Expert',
    location: 'Chennai',
    experience: '3 yrs',
    bookings: '150+',
    available: true,
    about:
    'Saree draping specialist providing traditional and modern saree draping styles for different occasions.',
    services: [
      ServiceOption('Saree Draping', 'Duration - 1 hour', 600),
      ServiceOption('Bridal Saree Draping', 'Duration - 2 hours', 1200),
    ],
  ),

  // ---------------- KEERTHIKA ----------------
  'Keerthika': ProviderDetails(
    name: 'Keerthika',
    role: 'Hair Stylist',
    location: 'Mylapore, Chennai',
    experience: '7 yrs',
    bookings: '420+',
    available: true,
    about:
    'Professional hair stylist creating bridal updos, soft curls and elegant party hairstyles that last through the whole event.',
    services: [
      ServiceOption('Bridal Hairstyle', 'Duration - 3 hours', 10000),
      ServiceOption('Party Hairstyle', 'Duration - 2 hours', 6000),
      ServiceOption('Simple Hairstyle', 'Duration - 1 hour', 4000),
    ],
    portfolio: [
      'assets/images/hairstyle_image1.png',
      'assets/images/hairstyle_image2.png',
      'assets/images/hairstyle_image3.png',

    ],
  ),
  'Sneha': ProviderDetails(
    name: 'Sneha',
    role: 'Hair Stylist',
    location: 'Porur, Chennai',
    experience: '4 yrs',
    bookings: '210+',
    available: true,
    about:
    'Creative hair stylist skilled in braids, buns and trendy party looks, with a focus on comfortable, long-lasting styles.',
    services: [
      ServiceOption('Bridal Hairstyle', 'Duration - 2 hours', 3500),
      ServiceOption('Party Hairstyle', 'Duration - 1 hour', 2000),
      ServiceOption('Simple Hairstyle', 'Duration - 45 minutes', 1200),
    ],
    portfolio: [
      'assets/images/hairstyle_image4.png',
      'assets/images/hairstyle_image5.png',
      'assets/images/hairstyle_image6.png',

    ],
  ),

  // ---------------- LAKSHMI ----------------
  'Lakshmi': ProviderDetails(
    name: 'Lakshmi',
    role: 'Mehandi Artist',
    location: 'Chennai',
    experience: '5 yrs',
    bookings: '280+',
    available: true,
    about:
    'Mehandi artist specializing in beautiful bridal and traditional designs for weddings and special occasions.',
    services: [
      ServiceOption('Bridal Mehandi', 'Duration - 4 hours', 2000),
      ServiceOption('Arabic Mehandi', 'Duration - 2 hours', 1000),
      ServiceOption('Simple Mehandi', 'Duration - 1 hour', 500),
    ],
    portfolio: [
      'assets/images/bridal_mehandi(1).png',
      'assets/images/bridal_mehandi(2).png',
      'assets/images/bridal_mehandi(3).png',
    ],
  ),

  // ---------------- REVATHI ----------------
  'Revathi': ProviderDetails(
    name: 'Revathi',
    role: 'Mehandi Artist',
    location: 'Chennai',
    experience: '3 yrs',
    bookings: '170+',
    available: true,
    about:
    'Creative mehandi artist offering traditional, Arabic and simple mehandi designs for different occasions.',
    services: [
      ServiceOption('Bridal Mehandi', 'Duration - 4 hours', 2500),
      ServiceOption('Arabic Mehandi', 'Duration - 2 hours', 1200),
      ServiceOption('Simple Mehandi', 'Duration - 1 hour', 700),
    ],
    portfolio: [
      'assets/images/bridal_mehandi(4).png',
      'assets/images/bridal_mehandi(5).png',
      'assets/images/bridal_mehandi(6).png',
    ],
  ),

  // ---------------- NISHA ----------------
  'Nisha': ProviderDetails(
    name: 'Nisha',
    role: 'Nail Artist',
    location: 'Chennai',
    experience: '3 yrs',
    bookings: '140+',
    available: true,
    about:
    'Nail artist creating stylish and beautiful nail art designs for parties, weddings and everyday occasions.',
    services: [
      ServiceOption('Nail Art', 'Duration - 1 hour', 900),
      ServiceOption('Gel Nail Art', 'Duration - 2 hours', 1500),
      ServiceOption('Bridal Nail Art', 'Duration - 2 hours', 2500),
    ],
    portfolio: [
      'assets/images/nails_art(1).png',
      'assets/images/nails_art(2).png',
      'assets/images/nails_art(3).png',
    ],
  ),

  // ---------------- KAVITHA ----------------
  'Kavitha': ProviderDetails(
    name: 'Kavitha',
    role: 'Nail Artist',
    location: 'Chennai',
    experience: '4 yrs',
    bookings: '210+',
    available: true,
    about:
    'Professional nail artist offering creative nail art, gel designs and occasion-ready nail styling.',
    services: [
      ServiceOption('Nail Art', 'Duration - 1 hour', 1200),
      ServiceOption('Gel Nail Art', 'Duration - 2 hours', 2500),
      ServiceOption('Bridal Nail Art', 'Duration - 2 hours', 4000),
    ],
    portfolio: [
      'assets/images/nails_art(4).png',
      'assets/images/nails_art(5).png',
      'assets/images/nails_art(6).png',
    ],
  ),
  'Sangeetha': ProviderDetails(
    name: 'Sangeetha',
    role: 'Saree Pre-pleating Expert',
    location: 'Chennai',
    experience: '2 yrs',
    bookings: '150+',
    available: true,
    about:
    'Experienced saree pre-pleating expert helping customers get their sarees perfectly prepared for weddings and special occasions.',
    services: [
      ServiceOption('Saree Pre-pleating', 'Duration -  30 minutes', 500),
      ServiceOption('Bridal Saree Pre-pleating', 'Duration - 1 hour', 1000),
    ],
  ),
  'Divya': ProviderDetails(
    name: 'Divya',
    role: 'Saree Draping Expert',
    location: 'Chennai',
    experience: '5 yrs',
    bookings: '200+',
    available: true,
    about:
    'Saree draping specialist providing traditional and modern saree draping styles for different occasions.',
    services: [
      ServiceOption('Saree Draping', 'Duration - 1 hour', 800),
      ServiceOption('Bridal Saree Draping', 'Duration - 2 hours', 1500),
    ],
  ),
};