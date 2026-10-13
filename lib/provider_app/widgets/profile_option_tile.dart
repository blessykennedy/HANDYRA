import 'package:flutter/material.dart';

class ProfileOptionTile extends StatelessWidget {
final IconData icon;
final String title;
final void Function(BuildContext context) onTap;
final bool showDivider;

const ProfileOptionTile({
super.key,
required this.icon,
required this.title,
required this.onTap,
this.showDivider = true,
});

@override
Widget build(BuildContext context) {
return Column(
children: [
InkWell(
onTap: () => onTap(context),
borderRadius: BorderRadius.circular(10),
child: SizedBox(
height: 40,
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 12),
child: Row(
children: [
Icon(
icon,
size: 13,
color: const Color(0xFF9A6845),
),
const SizedBox(width: 9),
Expanded(
child: Text(
title,
style: const TextStyle(
fontSize: 9,
fontWeight: FontWeight.w600,
),
),
),
const Icon(
Icons.chevron_right,
size: 15,
color: Color(0xFF9A6845),
),
],
),
),
),
),
if (showDivider)
const Divider(
height: 1,
thickness: 0.5,
indent: 12,
endIndent: 12,
color: Color(0xFFE7E2DE),
),
],
);
}
}

