import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class PortfolioScreen extends StatefulWidget {
const PortfolioScreen({super.key});

@override
State<PortfolioScreen> createState() =>
_PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
String selectedCategory = 'All';

final List<Map<String, String>> works = [
{
'title': 'Bridal Glam Look',
'category': 'Bridal Makeup',
'image': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQHR8FkTweEbR4gFtulwiHHJrO75CwNQoOzREVdLB_qKXOxzLCE',
},
{
'title': 'Bridal look',
'category': 'Bridal Makeup',
'image': 'https://i.pinimg.com/1200x/ff/68/bb/ff68bbadc974cd38596cc051ef6034a7.jpg',
},
{
'title': 'Party Glam',
'category': 'Party Makeup',
'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_uJ9XPFxomxtxg39u4hB5Y-vBiuuU0EYmpRot0SdVCoLgRQuD',
},
{
'title': 'Bridal look',
'category': 'Bridal Makeup',
'image': 'https://i.pinimg.com/736x/33/23/41/3323417b3262a9597eeb99c99db34482.jpg',
},
{
'title': 'Hair Styling',
'category': 'Styling',
'image': 'https://i.pinimg.com/236x/4c/d6/96/4cd6968c51a510b97050a2e0facd8083.jpg',
},
{
'title': 'Hair Styling',
'category': 'Hair Styling',
'image': 'https://i.pinimg.com/236x/69/e2/74/69e274c7b23703aaf2541c76e58098e7.jpg',
},
];

List<Map<String, String>> get filteredWorks {
if (selectedCategory == 'All') return works;

return works
    .where((work) =>
work['category'] == selectedCategory)
    .toList();
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
child: Column(
children: [
// HEADER
Container(
color: const Color(0xFFF4E0D2),
padding: const EdgeInsets.fromLTRB(
10, 5, 10, 15,
),
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
IconButton(
onPressed: () =>
Navigator.maybePop(context),
icon: const Icon(
Icons.arrow_back_ios,
size: 17,
),
),
Row(
children: [
const Expanded(
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Text(
'My Portfolio',
style: TextStyle(
fontSize: 21,
fontWeight:
FontWeight.bold,
),
),
SizedBox(height: 3),
Text(
'6 works uploaded',
style: TextStyle(
fontSize: 10,
),
),
],
),
),
ElevatedButton.icon(
onPressed: _addWork,
icon: const Icon(
Icons.add,
size: 17,
),
label: const Text('Add Work'),
style: ElevatedButton.styleFrom(
backgroundColor:
const Color(0xFFFFA000),
foregroundColor: Colors.white,
elevation: 0,
padding:
const EdgeInsets.symmetric(
horizontal: 10,
vertical: 10,
),
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(10),
),
),
),
],
),
],
),
),

// CATEGORY FILTERS
SizedBox(
height: 43,
child: ListView(
scrollDirection: Axis.horizontal,
padding:
const EdgeInsets.symmetric(
horizontal: 10,
vertical: 5,
),
children: [
_filterChip('All'),
_filterChip('Bridal Makeup'),
_filterChip('Party Makeup'),
_filterChip('Hair Styling'),

],
),
),

const Divider(height: 1),

// PORTFOLIO GRID
Expanded(
child: GridView.builder(
padding: const EdgeInsets.all(10),
itemCount: filteredWorks.length + 1,
gridDelegate:
const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 7,
mainAxisSpacing: 7,
childAspectRatio: 0.78,
),
itemBuilder: (context, index) {
if (index == filteredWorks.length) {
return _addPhotoTile();
}

final work = filteredWorks[index];

return _portfolioCard(work);
},
),
),
],
),
),

bottomNavigationBar: const BottomNav(
selectedIndex: 4,
),
);
}

Widget _filterChip(String category) {
final selected = selectedCategory == category;

return Padding(
padding: const EdgeInsets.only(right: 6),
child: ChoiceChip(
label: Text(category),
selected: selected,
onSelected: (_) {
setState(() {
selectedCategory = category;
});
},
labelStyle: TextStyle(
fontSize: 10,
color: selected ? Colors.black : Colors.black87,
fontWeight: selected
? FontWeight.bold
    : FontWeight.normal,
),
selectedColor: const Color(0xFFE7E7E7),
backgroundColor: Colors.white,
side: BorderSide.none,
shape: const StadiumBorder(),
showCheckmark: false,
padding: const EdgeInsets.symmetric(
horizontal: 5,
),
),
);
}

Widget _portfolioCard(Map<String, String> work) {
return GestureDetector(
onTap: () {
showDialog(
context: context,
builder: (context) => AlertDialog(
title: Text(work['title']!),
content: Text(
'Category: ${work['category']}',
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text('Close'),
),
],
),
);
},
child: ClipRRect(
borderRadius: BorderRadius.circular(8),
child: Stack(
fit: StackFit.expand,
children: [
Image.network(
work['image']!,
fit: BoxFit.cover,
errorBuilder: (_, __, ___) =>
Container(
color: const Color(0xFFF0E6DE),
child: const Icon(
Icons.image_outlined,
size: 40,
color: Colors.brown,
),
),
),
Positioned(
left: 0,
right: 0,
bottom: 0,
child: Container(
padding: const EdgeInsets.fromLTRB(
7, 22, 5, 7,
),
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
Colors.transparent,
Colors.black87,
],
),
),
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Text(
work['title']!,
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: const TextStyle(
color: Colors.white,
fontSize: 10,
fontWeight: FontWeight.bold,
),
),
Text(
work['category']!,
style: const TextStyle(
color: Colors.white70,
fontSize: 8,
),
),
],
),
),
),
],
),
),
);
}

Widget _addPhotoTile() {
return InkWell(
onTap: _addWork,
borderRadius: BorderRadius.circular(8),
child: Container(
decoration: BoxDecoration(
color: Colors.white,
border: Border.all(
color: Colors.grey.shade500,
),
borderRadius: BorderRadius.circular(8),
),
child: const Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.add,
color: Colors.grey,
size: 24,
),
SizedBox(height: 5),
Text(
'Add Photo',
style: TextStyle(
color: Colors.grey,
fontSize: 12,
fontWeight: FontWeight.w600,
),
),
],
),
),
);
}

void _addWork() {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Photo upload will be connected next.',
),
),
);
}
}

