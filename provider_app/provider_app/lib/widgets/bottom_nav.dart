import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
final int selectedIndex;

const BottomNav({
super.key,
required this.selectedIndex,
});

static const Color navColor = Color(0xFFF4E0D2);

void _navigate(BuildContext context, int index) {
final routes = [
'/home',
'/requests',
'/bookings',
'/earnings',
'/profile',
];

if (index == selectedIndex) return;

Navigator.pushReplacementNamed(
context,
routes[index],
);
}

@override
Widget build(BuildContext context) {
return BottomNavigationBar(
currentIndex: selectedIndex,
type: BottomNavigationBarType.fixed,
backgroundColor: navColor,
selectedItemColor: Colors.black,
unselectedItemColor: Colors.black54,
selectedFontSize: 9,
unselectedFontSize: 9,
iconSize: 21,
elevation: 5,
showSelectedLabels: true,
showUnselectedLabels: true,
onTap: (index) => _navigate(context, index),

items: const [
BottomNavigationBarItem(
icon: Icon(Icons.home_filled),
label: 'Home',
),
BottomNavigationBarItem(
icon: Icon(Icons.move_to_inbox),
label: 'Request',
),
BottomNavigationBarItem(
icon: Icon(Icons.work),
label: 'Bookings',
),
BottomNavigationBarItem(
icon: Icon(Icons.account_balance_wallet),
label: 'Earnings',
),
BottomNavigationBarItem(
icon: Icon(Icons.person),
label: 'Profile',
),
],
);
}
}

