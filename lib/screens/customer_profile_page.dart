import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/user_profile.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  static const brown = Color(0xFF604A3C);
  static const pink = Color(0xFFF3DED0);
  static const mocha = Color(0xFF9C7F6E);
  static const ink = Color(0xFF3E2F26);

  void _openEdit(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _EditProfileSheet(),
    );
  }

  void _logout(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProfile>(
      valueListenable: userProfile,
      builder: (context, p, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFFAF7),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'My Profile',
              style: GoogleFonts.poppins(
                color: brown,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 82,
                        width: 82,
                        decoration: const BoxDecoration(
                          color: brown,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 44,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        p.name,
                        style: GoogleFonts.poppins(
                          color: ink,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Customer',
                        style: GoogleFonts.poppins(
                          color: mocha,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 14),
                      OutlinedButton.icon(
                        onPressed: () => _openEdit(context),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: brown,
                          side: const BorderSide(color: brown, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                        ),
                        icon: const Icon(Icons.edit_outlined, size: 18),
                        label: Text(
                          'Edit Profile',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                _sectionTitle('Personal Information'),
                const SizedBox(height: 10),
                _profileCard(
                  icon: Icons.phone_outlined,
                  title: 'Phone Number',
                  value: p.phone,
                ),
                const SizedBox(height: 12),
                _profileCard(
                  icon: Icons.location_on_outlined,
                  title: 'Address',
                  value: p.location,
                ),
                const SizedBox(height: 22),
                _sectionTitle('My Activity'),
                const SizedBox(height: 10),
                _actionCard(
                  icon: Icons.calendar_month_outlined,
                  title: 'Booking History',
                  subtitle: 'View your previous and upcoming bookings',
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _actionCard(
                  icon: Icons.star_outline,
                  title: 'Reviews',
                  subtitle: 'View and manage your reviews',
                  onTap: () {},
                ),
                const SizedBox(height: 22),
                _sectionTitle('Location'),
                const SizedBox(height: 10),
                _actionCard(
                  icon: Icons.my_location,
                  title: 'My Location',
                  subtitle: p.location,
                  onTap: () {},
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () => _logout(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brown,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.logout),
                    label: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: brown,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _profileCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: pink, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: pink,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: brown, size: 23),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(color: mocha, fontSize: 12),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    color: ink,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: pink, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: brown, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: ink,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(color: mocha, fontSize: 11.5),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: mocha),
          ],
        ),
      ),
    );
  }
}

class _EditProfileSheet extends StatefulWidget {
  const _EditProfileSheet();

  @override
  State<_EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<_EditProfileSheet> {
  static const brown = Color(0xFF604A3C);
  static const pink = Color(0xFFF3DED0);
  static const mocha = Color(0xFF9C7F6E);
  static const ink = Color(0xFF3E2F26);

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _location;

  @override
  void initState() {
    super.initState();
    final p = userProfile.value;
    _name = TextEditingController(text: p.name);
    _phone = TextEditingController(text: p.phone);
    _location = TextEditingController(text: p.location);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _location.dispose();
    super.dispose();
  }

  InputDecoration _decoration(String label, IconData icon) {
    OutlineInputBorder border(Color color, double width) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color, width: width),
    );
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(fontSize: 13, color: mocha),
      prefixIcon: Icon(icon, color: brown),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: border(pink, 1.5),
      focusedBorder: border(brown, 1.8),
      errorBorder: border(Colors.redAccent, 1.5),
      focusedErrorBorder: border(Colors.redAccent, 1.8),
    );
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final messenger = ScaffoldMessenger.of(context);
    final current = userProfile.value;
    userProfile.value = UserProfile(
      name: _name.text.trim(),
      email: current.email,
      phone: _phone.text.trim(),
      location: _location.text.trim(),
    );
    Navigator.pop(context);
    messenger.showSnackBar(const SnackBar(content: Text('Profile updated')));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFAF7),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: pink,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(
                    color: ink,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _name,
                  style: GoogleFonts.poppins(fontSize: 14),
                  decoration: _decoration('Full Name', Icons.person_outline),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Enter your name'
                      : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.poppins(fontSize: 14),
                  decoration: _decoration('Phone Number', Icons.phone_outlined),
                  validator: (v) {
                    final digits = (v ?? '').replaceAll(RegExp(r'\D'), '');
                    return digits.length < 10 ? 'Enter a valid number' : null;
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _location,
                  style: GoogleFonts.poppins(fontSize: 14),
                  decoration:
                  _decoration('Address', Icons.location_on_outlined),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Enter your address'
                      : null,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brown,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Save Changes',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}