import 'package:flutter/material.dart';
import 'package:machine_app/page_for_motor/MotorStatisticsPage.dart';
import 'package:machine_app/page_for_motor/electric_motor.dart';
import 'package:machine_app/page_for_motor/mechincal_motor.dart';
import 'package:machine_app/notidcation_and_features/calc.dart';
import 'package:machine_app/quiz.dart';
import 'package:machine_app/page_for_motor/MachinePrinciplesPage.dart';
import 'package:machine_app/page_for_motor/ArticlesPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'مرحبًا بك في MotorVision!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[800] : Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'هل تعلم؟',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '- المحركات الكهربائية تستخدم لتحويل الطاقة الكهربائية إلى طاقة ميكانيكية.',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '- المحركات الحديثة تعتمد على تقنيات التحكم الرقمي لتحسين الكفاءة.',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildFeatureCard(
                    Icons.electric_car, 'المحرك الكهربائي', context),
                _buildFeatureCard(
                    Icons.engineering, 'المحرك الميكانيكي', context),
                _buildFeatureCard(Icons.calculate, 'حسابات المحرك', context),
                _buildFeatureCard(
                    Icons.bar_chart, "إحصائيات المحركات", context),
                _buildFeatureCard(Icons.quiz, 'اختبار المحرك', context),
                _buildFeatureCard(Icons.article, 'المقالات', context),
                _buildFeatureCard(Icons.abc, "مبادىء الالات ", context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String label, BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        if (label == 'المحرك الكهربائي') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ElectricMotorPage()));
        } else if (label == 'المحرك الميكانيكي') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MechanicalEnginePage()));
        } else if (label == 'حسابات المحرك') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MotorCalculationPage()));
        } else if (label == 'اختبار المحرك') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MotorQuizPage()));
        } else if (label == 'المقالات') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ArticlesPage()));
        } else if (label == 'مبادىء الالات ') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MachinePrinciplesPage()));
        } else if (label == 'إحصائيات المحركات') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MotorStatisticsPage()));
        }
      },
      child: Card(
        color: isDarkMode ? Colors.grey[800] : Colors.blue[50],
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 40,
                  color: isDarkMode ? Colors.white : Colors.blueAccent),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
