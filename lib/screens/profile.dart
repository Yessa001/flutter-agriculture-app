import 'package:flutter/material.dart';
import 'package:flutter_w6/screens/home.dart';
import 'package:flutter_w6/screens/login.dart';
import 'package:flutter_w6/screens/edit_profile.dart';
import 'package:flutter_w6/widgets/bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      setState(() {
        _selectedIndex = index;
      });
    } else if (index == 2) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }
  // Navigate to Edit Profile
  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green[300],
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                // Profile Image
                child: CircleAvatar(
                  backgroundImage: const AssetImage('lib/assets/foto.jpg'),
                  radius: 60,
                  backgroundColor: Colors.green[50],
                ),
              ),
              // User Information
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Veshaka Yessananta Rianto',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 1),
              Center(
                child: Text(
                  'Universitas Teknologi Yogyakarta',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 1),
              Center(
                child: Text(
                  'yessananta001@gmail.com',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // List View Setting
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Column(
                    children: [
                      // Manage Account
                      ListTile(
                        title: const Text(
                          'Manage Account',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: _navigateToEditProfile,
                      ),
                      Divider(height: 1, color: Colors.green[300]),
                      // Notifications
                      ListTile(
                        title: const Text(
                          'Notifications',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // ###
                        },
                      ),
                      Divider(height: 1, color: Colors.green[300]),
                      // Privacy Policy
                      ListTile(
                        title: const Text(
                          'Privacy Policy',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // ###
                        },
                      ),
                      Divider(height: 1, color: Colors.green[300]),
                      // Term of Service
                      ListTile(
                        title: const Text(
                          'Term of Service',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // ###
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
