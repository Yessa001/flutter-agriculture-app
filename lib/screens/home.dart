import 'package:flutter/material.dart';
import 'package:flutter_w6/screens/login.dart';
import 'package:flutter_w6/screens/profile.dart';
import 'package:flutter_w6/widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else if (index == 2) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sample data GridView & ListView
    final List<Map<String, dynamic>> items = [
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'Item 1',
        'price': 'Rp. 100.000,00',
      },
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'Item 2',
        'price': 'Rp. 100.000,00',
      },
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'Item 3',
        'price': 'Rp. 100.000,00',
      },
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'Item 4',
        'price': 'Rp. 100.000,00',
      },
    ];

    final List<Map<String, dynamic>> listItems = [
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'List Item 1',
        'price': 'Rp. 100.000,00',
      },
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'List Item 2',
        'price': 'Rp. 100.000,00',
      },
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'List Item 3',
        'price': 'Rp. 100.000,00',
      },
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'List Item 4',
        'price': 'Rp. 100.000,00',
      },
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'List Item 5',
        'price': 'Rp. 100.000,00',
      },
      {
        'image': 'lib/assets/plant.jpg',
        'name': 'List Item 6',
        'price': 'Rp. 100.000,00',
      },
    ];

    // AppBar Application
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.green[300],
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.green[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Profile Image
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('lib/assets/foto.jpg'),
                        radius: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Welcome, User!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // GridView
            SizedBox(
              height: 160,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0),
                          child: Image.asset(
                            items[index]['image'],
                            width: 100,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          items[index]['name'],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                        Text(
                          items[index]['price'],
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // ListView
            Expanded(
              child: ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Image.asset(
                        listItems[index]['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(listItems[index]['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),),
                      subtitle: Text(
                        listItems[index]['price'],
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      trailing: const Icon(Icons.more_horiz),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
