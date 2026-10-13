import 'package:flutter/foundation.dart';

class BookingStore {
  static final ValueNotifier<List<Map<String, String>>>
  acceptedBookings = ValueNotifier([]);
}