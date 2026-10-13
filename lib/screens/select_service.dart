import 'package:flutter/material.dart';
import '../data/provider_details.dart';
import 'date_time.dart';

class SelectService extends StatefulWidget {
  const SelectService({
    super.key,
    required this.details,
    this.initialIndex = 0,
  });

  final ProviderDetails details;
  final int initialIndex;

  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  static const brown = Color(0xFF604A3C);
  static const pink = Color(0xFFF3DED0);

  late int selectedService;

  @override
  void initState() {
    super.initState();

    selectedService = widget.initialIndex;

    if (selectedService >= widget.details.services.length) {
      selectedService = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final services = widget.details.services;

    return Scaffold(
      backgroundColor: pink,

      appBar: AppBar(
        backgroundColor: pink,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Back',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Service',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              'Choose a service with ${widget.details.name}',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 20),

            ...List.generate(
              services.length,
                  (index) {
                final service = services[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedService = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: selectedService == index
                            ? brown
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                service.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                service.duration,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          '₹ ${formatPrice(service.price)}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: brown,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                onPressed: () {
                  final selectedServiceOption = services[selectedService];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DateTimePage(
                        provider: widget.details,
                        service: selectedServiceOption,
                      ),
                    ),
                  );
                },

                child: const Text(
                  'Continue → Choose Date & Time',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
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