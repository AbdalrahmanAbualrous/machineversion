import 'package:flutter/material.dart';
import 'package:machine_app/quiz.dart'; // Make sure this import is correct
import 'package:url_launcher/url_launcher.dart'; // For opening video links in the browser

class MechanicalEnginePage extends StatefulWidget {
  const MechanicalEnginePage({super.key});

  @override
  _MechanicalEnginePageState createState() => _MechanicalEnginePageState();
}

class _MechanicalEnginePageState extends State<MechanicalEnginePage> {
  @override
  Widget build(BuildContext context) {
    // Get colors based on the current theme
    Color textColor = Theme.of(context).textTheme.bodyLarge!.color!;
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    Color appBarColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.blue;

    Color cardColor = Theme.of(context).cardColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('المحرك الميكانيكي'),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'المحرك الميكانيكي (Mechanical Engine):',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Short explanation
              Text(
                '''المحرك الميكانيكي هو جهاز يستخدم لتحويل أنواع مختلفة من الطاقة مثل الطاقة الحرارية أو الكيميائية إلى طاقة ميكانيكية. يعمل المحرك باستخدام مكونات مثل الأسطوانة والمكبس لتحويل الطاقة الكيميائية إلى طاقة حركية.''',
                style: TextStyle(fontSize: 16, color: textColor),
              ),
              const SizedBox(height: 20),

              // Accordion for components of mechanical engine
              _buildAccordion(
                'مكونات المحرك الميكانيكي',
                '''
- الأسطوانة (Cylinder)
- المكبس (Piston)
- العمود المرفقي (Crankshaft)
- الصمامات (Valves)
- البواجي (Spark Plugs)
                ''',
                textColor,
              ),
              const SizedBox(height: 20),

              // Accordion for how it works
              _buildAccordion(
                'كيفية عمل المحرك الميكانيكي',
                '''
عند حرق الوقود داخل الأسطوانة، يتم توليد ضغط وحرارة، مما يدفع المكبس لتحريك العمود المرفقي وتحويل الطاقة إلى حركة دائرية.
                ''',
                textColor,
              ),
              const SizedBox(height: 20),

              // Accordion for types of engines
              _buildAccordion(
                'أنواع المحركات الميكانيكية',
                '''
1. محرك الاحتراق الداخلي (Internal Combustion Engine)
2. محرك الاحتراق الخارجي (External Combustion Engine)
3. المحركات الهوائية (Air Engines)
                ''',
                textColor,
              ),
              const SizedBox(height: 20),

              // Accordion for applications of engines
              _buildAccordion(
                'تطبيقات المحرك الميكانيكي',
                '''
- السيارات
- الطائرات
- الآلات الصناعية
                ''',
                textColor,
              ),
              const SizedBox(height: 20),

              // Video section
              SectionTitle(
                  title: 'الفيديو التوضيحي',
                  textColor: textColor,
                  cardColor: cardColor),
              ElevatedButton(
                onPressed: () async {
                  // Open video link using url_launcher
                  const videoUrl =
                      'https://youtu.be/ZQvfHyfgBtA?si=mdNpgBzJgWsSgE3e';
                  if (await canLaunch(videoUrl)) {
                    await launch(videoUrl);
                  } else {
                    throw 'Could not launch $videoUrl';
                  }
                },
                child: Text('عرض الفيديو التوضيحي',
                    style: TextStyle(color: textColor)),
              ),
              const SizedBox(height: 20),

              // Quiz section
              SectionTitle(
                  title: 'اختبر فهمك:',
                  textColor: textColor,
                  cardColor: cardColor),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the quiz page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MotorQuizPage()),
                  );
                },
                child:
                    Text('ابدأ الاختبار', style: TextStyle(color: textColor)),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }

  // Accordion widget to display content
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
}

// SectionTitle widget for section headers
class SectionTitle extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color cardColor;

  const SectionTitle(
      {super.key,
      required this.title,
      required this.textColor,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    );
  }
}
