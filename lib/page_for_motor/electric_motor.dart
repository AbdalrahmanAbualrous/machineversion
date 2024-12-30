import 'package:flutter/material.dart';
import 'package:machine_app/quiz.dart'; // Make sure this import is correct
import 'package:url_launcher/url_launcher.dart';

class ElectricMotorPage extends StatelessWidget {
  const ElectricMotorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get colors based on the current theme
    Color textColor = Theme.of(context).textTheme.bodyLarge!.color!;
    Color appBarColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: const Text('المحرك الكهربائي'),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'المحرك الكهربائي(Electrical Engine):',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildDescriptionText(
                'المحرك الكهربائي هو جهاز يستخدم الطاقة الكهربائية لتحويلها إلى طاقة حركية ميكانيكية. يعمل المحرك الكهربائي على مبدأ الحقول المغناطيسية والتفاعلات بين التيار الكهربائي والمغناطيس.',
                textColor,
              ),
              const SizedBox(height: 20),

              // Accordion Sections
              _buildAccordion(
                  'مكونات المحرك الكهربائي',
                  '''
- الملفات (Coils)
- المغناطيس
- الدوار (Rotor)
- الستاتور (Stator)
- فرشاة (Brushes)
- المبدل (Commutator)
''',
                  textColor),
              _buildAccordion(
                  'كيفية عمل المحرك الكهربائي',
                  '''
عند مرور تيار كهربائي عبر الأسلاك في الملف (الذي يوجد في الدوار)، يتم توليد حقل مغناطيسي حوله. هذا الحقل المغناطيسي يتفاعل مع الحقل المغناطيسي للمغناطيس مما يؤدي إلى دوران الدوار وتحويل الطاقة الكهربائية إلى حركة.
''',
                  textColor),
              _buildAccordion(
                  'أنواع المحركات الكهربائية',
                  '''
1. محركات التيار المستمر (DC Motors)
2. محركات التيار المتناوب (AC Motors)
3. المحركات الخطوية (Stepper Motors)
''',
                  textColor),
              _buildAccordion(
                  'تطبيقات المحرك الكهربائي',
                  '''
- الأجهزة المنزلية
- السيارات الكهربائية
- المعدات الصناعية
''',
                  textColor),
              const SizedBox(height: 20),

              // Video Section
              _buildSectionTitle('الفيديو التوضيحي', textColor),
              _buildVideoButton(),
              const SizedBox(height: 20),

              // Quiz Section
              _buildSectionTitle('اختبر فهمك:', textColor),
              _buildQuizButton(context),

              const SizedBox(height: 20),

              // More Information Link
              _buildSectionTitle('المزيد من المعلومات', textColor),
              _buildMoreInfoButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Section Title Widget
  Widget _buildSectionTitle(String title, Color textColor) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  // Reusable Description Text Widget
  Widget _buildDescriptionText(String description, Color textColor) {
    return Text(
      description,
      style: TextStyle(fontSize: 16, color: textColor),
    );
  }

  // Reusable Accordion Widget
  Widget _buildAccordion(String title, String content, Color textColor) {
    return ExpansionTile(
      title: Text(title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text(content, style: TextStyle(fontSize: 16, color: textColor)),
        ),
      ],
    );
  }

  // Video Button
  Widget _buildVideoButton() {
    return ElevatedButton(
      onPressed: () async {
        // Open video link using url_launcher
        const videoUrl = 'https://youtu.be/CWulQ1ZSE3c?si=y71HEDZKJW6faj94';
        if (await canLaunchUrl(Uri.parse(videoUrl))) {
          await launchUrl(Uri.parse(videoUrl));
        } else {
          throw 'Could not launch $videoUrl';
        }
      },
      child: const Text('عرض الفيديو التوضيحي'),
    );
  }

  // Quiz Button
  Widget _buildQuizButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the quiz page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MotorQuizPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text('ابدأ الاختبار'),
    );
  }

  // More Info Button
  Widget _buildMoreInfoButton() {
    return TextButton(
      onPressed: () {
        // Open link to more information
      },
      child: const Text(
        'المزيد من المعلومات',
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue,
        ),
      ),
    );
  }
}
