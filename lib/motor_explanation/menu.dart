import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final Function(int) onItemTapped;
  const DrawerMenu({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('القائمة الرئيسية'),
          ),
          _buildDrawerItem(Icons.home, 'الرئيسية', 0, context),
          _buildDrawerItem(Icons.electric_car, 'المحرك الكهربائي', 1, context),
          _buildDrawerItem(Icons.engineering, 'المحرك الميكانيكي', 2, context),
          _buildDrawerItem(Icons.calculate, 'حسابات المحرك', 3, context),
          _buildDrawerItem(Icons.quiz, 'اختبار المحرك', 4, context),
          _buildDrawerItem(Icons.article, 'المقالات', 5, context),
          _buildDrawerItem(Icons.abc, 'مبادىء الالات', 6, context),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('حول التطبيق'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'MotorVision',
                applicationVersion: '1.0.0',
                children: const [
                  Text(
                      'هذا التطبيق أنشأه عبدالرحمن أبو الروس. الهدف من التطبيق هو توفير فائدة لطلاب الهندسة من خلال التعرف على المحركات واستخداماتها.')
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(
      IconData icon, String title, int index, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        onItemTapped(index);
        Navigator.pop(context);
      },
    );
  }
}
