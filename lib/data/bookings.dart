import 'package:flutter/material.dart';
import 'provider_details.dart';

class Booking {
  const Booking({
    required this.id,
    required this.providerName,
    required this.role,
    required this.location,
    required this.serviceName,
    required this.duration,
    required this.price,
    required this.date,
    required this.time,
    this.status = 'Upcoming',
  });

  final String id;
  final String providerName;
  final String role;
  final String location;
  final String serviceName;
  final String duration;
  final int price;
  final DateTime date;
  final String time;
  final String status;

  Booking copyWith({String? status}) {
    return Booking(
      id: id,
      providerName: providerName,
      role: role,
      location: location,
      serviceName: serviceName,
      duration: duration,
      price: price,
      date: date,
      time: time,
      status: status ?? this.status,
    );
  }
}

final ValueNotifier<List<Booking>> bookings = ValueNotifier<List<Booking>>([]);

final ValueNotifier<int?> tabRequest = ValueNotifier<int?>(null);

String formatDate(DateTime d) {
  const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${days[d.weekday - 1]}, ${d.day} ${months[d.month - 1]} ${d.year}';
}

void cancelBooking(String id) {
  bookings.value = [
    for (final b in bookings.value)
      b.id == id ? b.copyWith(status: 'Cancelled') : b,
  ];
}

void completeBooking(
    BuildContext context, {
      required ProviderDetails provider,
      required ServiceOption service,
      required DateTime date,
      required String time,
    }) {
  final messenger = ScaffoldMessenger.of(context);
  final booking = Booking(
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    providerName: provider.name,
    role: provider.role,
    location: provider.location,
    serviceName: service.name,
    duration: service.duration,
    price: service.price,
    date: date,
    time: time,
  );
  bookings.value = [booking, ...bookings.value];
  tabRequest.value = 2;
  Navigator.of(context).popUntil((route) => route.isFirst);
  messenger.showSnackBar(
    SnackBar(content: Text('Booking confirmed with ${provider.name}')),
  );
}