import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = [
      {
        'name': 'Daffne',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZWZqLZRb1VG-9ACte6ifehofiAJUFZr69ubkEZIdOHGAmpFlZ',
        'rating': 5.0,
        'date': 'Dec 15, 2024',
        'service': 'Bridal Makeup',
        'comment': 'Absolutely amazing work! Priya is incredibly talented and professional. My bridal makeup stayed intact all day long and looked picture perfect!',
      },
      {
        'name': 'Roshini',
        'image': 'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=',
        'rating': 5.0,
        'date': 'Dec 05, 2024',
        'service': 'Party Makeup',
        'comment': 'Loved the party makeup, lasted the whole night! Got so many compliments from everyone at the event.',
      },
      {
        'name': 'Meena',
        'image': 'https://i.pinimg.com/736x/8a/a0/29/8aa029fd2d996fa884bf1fcf45db55e9.jpg',
        'rating': 4.8,
        'date': 'Nov 28, 2024',
        'service': 'Engagement Makeup',
        'comment': 'Very punctual and neat work. Used premium products and styled hair beautifully.',
      },
      {
        'name': 'Anitha',
        'image': 'https://i.pravatar.cc/150?img=20',
        'rating': 5.0,
        'date': 'Nov 14, 2024',
        'service': 'Airbrush Makeup',
        'comment': 'Flawless finish! Worth every rupee. Highly recommended for any grand occasion.',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4E0D2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Customer Reviews & Ratings",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rating Overview Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "4.9",
                          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF654B3C)),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text("312 Reviews", style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          _ratingBar("5 Star", 0.92),
                          _ratingBar("4 Star", 0.06),
                          _ratingBar("3 Star", 0.01),
                          _ratingBar("2 Star", 0.00),
                          _ratingBar("1 Star", 0.01),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "All Client Feedback",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...reviews.map((review) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(review['image']),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review['name'],
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(
                                review['service'],
                                style: const TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 14),
                                const SizedBox(width: 2),
                                Text(
                                  review['rating'].toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              review['date'],
                              style: const TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      review['comment'],
                      style: const TextStyle(fontSize: 12, height: 1.4, color: Colors.black87),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _ratingBar(String label, double pct) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          const SizedBox(width: 6),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: pct,
                minHeight: 6,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(Color(0xFFE06C20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
