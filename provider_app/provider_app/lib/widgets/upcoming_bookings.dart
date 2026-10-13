import 'package:flutter/material.dart';

class UpcomingBookings extends StatelessWidget {
  const UpcomingBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Heading
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                "Upcoming Bookings",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/bookings');
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF634936),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Daffne
        _BookingCard(
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZWZqLZRb1VG-9ACte6ifehofiAJUFZr69ubkEZIdOHGAmpFlZ",
          name: "Daffne",
          service: "Bridal Makeup",
          date: "Dec 15",
          time: "09:00 AM",
          price: "₹3,500",
        ),

        const SizedBox(height: 9),

        // Roshini
        _BookingCard(
          image: "https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=",
          name: "Roshini",
          service: "Party Makeup",
          date: "Dec 22",
          time: "05:00 PM",
          price: "₹1,200",
        ),
      ],
    );
  }
}

class _BookingCard extends StatelessWidget {
  final String image;
  final String name;
  final String service;
  final String date;
  final String time;
  final String price;

  const _BookingCard({
    required this.image,
    required this.name,
    required this.service,
    required this.date,
    required this.time,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/bookings');
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.13),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [

              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(image),
              ),

              const SizedBox(width: 9),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      service,
                      style: const TextStyle(
                        fontSize: 9,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Row(
                      children: [

                        Text(
                          "📅 $date",
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.black54,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(
                          "◷ $time",
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF654B3C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}