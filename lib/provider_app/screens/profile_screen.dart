import 'package:flutter/material.dart';
import 'availability_screen.dart';
import 'bank_details_screen.dart';
import 'help_support_screen.dart';
import 'notifications_screen.dart';
import 'privacy_screen.dart';
import 'reviews_screen.dart';
import 'services_screen.dart';
import 'verification_screen.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/profile_option_tile.dart';
import 'portfolio_screen.dart';
import 'change_password_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
const ProfileScreen({super.key});

static const Color peach = Color(0xFFF4E0D2);
static const Color brown = Color(0xFF705342);

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF8F7F5),

body: SafeArea(
child: SingleChildScrollView(
padding: const EdgeInsets.fromLTRB(10, 12, 10, 16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// ========================================
// PROFILE HEADER
// ========================================
Row(
children: [
const CircleAvatar(
radius: 25,
backgroundImage: NetworkImage(
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa5tFWIZ4-_uugtv4iQFRIHL6UF4k9969qAeTSqD0Sn508si3w',
),
),
const SizedBox(width: 10),

const Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Text(
'Priya',
style: TextStyle(
fontSize: 17,
fontWeight: FontWeight.bold,
),
),
SizedBox(width: 5),
Icon(
Icons.verified,
color: Colors.green,
size: 14,
),
],
),
SizedBox(height: 3),
Text(
'Makeup Artist & Hair Stylist',
style: TextStyle(fontSize: 9),
),
SizedBox(height: 3),
Text(
'📍 Thoraipakkam, Chennai',
style: TextStyle(
fontSize: 9,
color: Colors.grey,
),
),
],
),
),

IconButton(
onPressed: () {
_showMessage(context, 'More options');
},
icon: const Icon(Icons.more_horiz),
),
],
),

const SizedBox(height: 12),

// ========================================
// PROFILE STATISTICS
// ========================================
Row(
children: const [
_StatBox(
value: '847',
label: 'Jobs Done',
),
SizedBox(width: 6),
_StatBox(
value: '₹28.5K',
label: 'This Month',
),
SizedBox(width: 6),
_StatBox(
value: '98%',
label: 'Response',
),
],
),

const SizedBox(height: 12),

// ========================================
// SKILLS
// ========================================
_sectionCard(
title: 'SKILLS',
child: Wrap(
spacing: 6,
runSpacing: 7,
children: const [
_SkillChip('Bridal Makeup'),
_SkillChip('Party Makeup'),
_SkillChip('Airbrush'),
_SkillChip('HD Makeup'),
_SkillChip('Hair Styling'),
_SkillChip('Updo'),

],
),
),

const SizedBox(height: 12),

// ========================================
// PROFESSIONAL
// ========================================
const _SectionHeading('PROFESSIONAL'),

_menuCard([
  ProfileOptionTile(
    icon: Icons.person_outline,
    title: 'Edit Profile',
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        ),
      );
    },
  ),

ProfileOptionTile(
icon: Icons.design_services,
title: 'My Services & Pricing',
  onTap: (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ServicesScreen()
      ),
    );
  },
),

ProfileOptionTile(
icon: Icons.image_outlined,
title: 'Portfolio',
onTap: (context) {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
const PortfolioScreen(),
),
);
},
),

ProfileOptionTile(
icon: Icons.calendar_month_outlined,
title: 'Availability & Hours',
showDivider: false,
  onTap: (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const AvailabilityScreen()
      ),
    );
  },
),
]),

const SizedBox(height: 12),

// ========================================
// BUSINESS
// ========================================
const _SectionHeading('BUSINESS'),

_menuCard([
ProfileOptionTile(
icon: Icons.account_balance,
title: 'Bank Details',
  onTap: (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const BankDetailsScreen()
      ),
    );
  },
),

ProfileOptionTile(
icon: Icons.description_outlined,
title: 'Verification Documents',
  onTap: (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const VerificationScreen()
      ),
    );
  },
),

ProfileOptionTile(
icon: Icons.star,
title: 'My Reviews',
showDivider: false,
  onTap: (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ReviewsScreen()
      ),
    );
  },
),
]),

const SizedBox(height: 12),

// ========================================
// SETTINGS
// ========================================
const _SectionHeading('SETTINGS'),

_menuCard([
  ProfileOptionTile(
    icon: Icons.key,
    title: 'Change Password',
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChangePasswordScreen(),
        ),
      );
    },
  ),

ProfileOptionTile(
icon: Icons.notifications,
title: 'Notifications',
  onTap: (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const NotificationsScreen()
      ),
    );
  },
),

ProfileOptionTile(
icon: Icons.lock_outline,
title: 'Privacy',
  onTap: (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const PrivacyScreen()
      ),
    );
  },
),

ProfileOptionTile(
icon: Icons.help_outline,
title: 'Help & Support',
showDivider: false,
  onTap: (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const HelpSupportScreen()
      ),
    );
  },
),
]),

const SizedBox(height: 12),

// ========================================
// LOGOUT BUTTON
// ========================================
SizedBox(
width: double.infinity,
height: 42,
child: ElevatedButton.icon(
onPressed: () {
_confirmLogout(context);
},
icon: const Icon(
Icons.logout,
size: 17,
),
label: const Text(
'Logout',
style: TextStyle(fontSize: 12),
),
style: ElevatedButton.styleFrom(
backgroundColor:
const Color(0xFFFFD8D8),
foregroundColor: Colors.red,
elevation: 2,
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(10),
),
),
),
),
],
),
),
),

// ========================================
// BOTTOM NAVIGATION
// ========================================
bottomNavigationBar: const BottomNav(
selectedIndex: 4,
),
);
}

// PROFILE SKILLS CARD
static Widget _sectionCard({
required String title,
required Widget child,
}) {
return Container(
width: double.infinity,
padding: const EdgeInsets.all(12),
decoration: _cardDecoration(),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: const TextStyle(
fontSize: 9,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 9),
child,
],
),
);
}

// WHITE MENU CARD
static Widget _menuCard(List<Widget> children) {
return Container(
decoration: _cardDecoration(),
child: Column(children: children),
);
}

// CARD DESIGN
static BoxDecoration _cardDecoration() {
return BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(12),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.12),
blurRadius: 5,
offset: const Offset(0, 2),
),
],
);
}

// DETAIL DIALOG FOR MENU ITEMS
static void _showDetailDialog(
BuildContext context,
String title,
String details,
) {
showDialog<void>(
context: context,
builder: (dialogContext) {
return AlertDialog(
title: Text(title),
content: Text(details, style: const TextStyle(height: 1.4)),
actions: [
TextButton(
onPressed: () {
Navigator.pop(dialogContext);
},
child: const Text('Close'),
),
],
);
},
);
}

// TEMPORARY MENU ACTION
static void _showMessage(
BuildContext context,
String message,
) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text('$message selected'),
duration: const Duration(seconds: 1),
),
);
}

// LOGOUT CONFIRMATION
static void _confirmLogout(BuildContext context) {
showDialog<void>(
context: context,
builder: (dialogContext) {
return AlertDialog(
title: const Text('Logout'),
content: const Text(
'Are you sure you want to logout?',
),
actions: [
TextButton(
onPressed: () {
Navigator.pop(dialogContext);
},
child: const Text('Cancel'),
),
TextButton(
onPressed: () {
Navigator.pop(dialogContext);
_showMessage(context, 'Logout');
},
child: const Text(
'Logout',
style: TextStyle(color: Colors.red),
),
),
],
);
},
);
}
}

// ============================================
// STATISTICS BOX
// ============================================
class _StatBox extends StatelessWidget {
final String value;
final String label;

const _StatBox({
required this.value,
required this.label,
});

@override
Widget build(BuildContext context) {
return Expanded(
child: Container(
height: 53,
decoration: BoxDecoration(
color: const Color(0xFFF8F1E9),
borderRadius: BorderRadius.circular(9),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
value,
style: const TextStyle(
fontSize: 12,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 3),
Text(
label,
style: const TextStyle(fontSize: 8),
),
],
),
),
);
}
}

// ============================================
// SKILL CHIP
// ============================================
class _SkillChip extends StatelessWidget {
final String skill;

const _SkillChip(this.skill);

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(
horizontal: 9,
vertical: 5,
),
decoration: BoxDecoration(
color: const Color(0xFFF5F0EA),
borderRadius: BorderRadius.circular(6),
border: Border.all(
color: const Color(0xFFE9DFD5),
),
),
child: Text(
skill,
style: const TextStyle(fontSize: 8),
),
);
}
}

// ============================================
// SECTION HEADING
// ============================================
class _SectionHeading extends StatelessWidget {
final String title;

const _SectionHeading(this.title);

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.only(
left: 5,
bottom: 6,
),
child: Text(
title,
style: const TextStyle(
fontSize: 9,
fontWeight: FontWeight.bold,
),
),
);
}
}

