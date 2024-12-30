import 'package:flutter/material.dart';
import 'package:machine_app/home_and_homescreen/home_screen.dart';
import 'package:machine_app/Qstudent.dart';
import 'package:machine_app/notidcation_and_features/CustomDrawer.dart';
import 'package:machine_app/page_for_motor/notification_page.dart';

class BottomNavigation extends StatefulWidget {
  final Function toggleTheme;

  const BottomNavigation({super.key, required this.toggleTheme});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index >= 0 && index < 3) {
        _selectedIndex = index;
      }
    });
  }

  Widget _getPageForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const InquiryPage();
      case 2:
        return const NotificationsPage();
      default:
        return const Center(child: Text('صفحة غير موجودة'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.build, size: 28),
            SizedBox(width: 8),
            Text('MotorVision'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              widget.toggleTheme();
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _getPageForIndex(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.blueAccent,
        unselectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white70
            : const Color.fromARGB(179, 0, 0, 0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'الاستفسارات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'الإشعارات',
          ),
        ],
      ),
    );
  }
}
