import 'package:flutter/material.dart';
import 'package:machine_app/quiz.dart'; // تأكد من إضافة الاستيراد المناسب لصفحة الاختبار

class MachinePrinciplesPage extends StatefulWidget {
  const MachinePrinciplesPage({super.key});

  @override
  _MachinePrinciplesPageState createState() => _MachinePrinciplesPageState();
}

class _MachinePrinciplesPageState extends State<MachinePrinciplesPage> {
  bool _isDarkMode = false;

  // دالة لتبديل وضع الليل والنهار
  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // تحديد الألوان بناءً على وضع الليل أو النهار
    Color textColor = _isDarkMode ? Colors.white : Colors.black;
    Color backgroundColor = _isDarkMode ? Colors.black : Colors.white;
    Color appBarColor = _isDarkMode ? Colors.black87 : Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: const Text('مبادئ عمل الآلات'),
        backgroundColor: appBarColor,
        foregroundColor: textColor, // تخصيص لون النص في AppBar
        actionsIconTheme:
            IconThemeData(color: textColor), // تخصيص لون الأيقونات في AppBar
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
            onPressed: _toggleDarkMode,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // بطاقة للمقدمة مع تخصيص الألوان
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: _isDarkMode
                    ? Colors.grey[800]
                    : Colors.blue[50], // تغيير الخلفية بناءً على الوضع
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'مبادئ عمل الآلات:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor, // لون النص يتغير حسب الوضع
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // شرح قصير لمبادئ عمل الآلات
              Text(
                '''مبادئ عمل الآلات تعتمد على فهم كيفية تحويل الطاقة من شكل إلى آخر باستخدام تقنيات مثل الحث المغناطيسي والمحركات الكهربائية. في هذه الصفحة سنتعرف على الترانسفورمر، الدارات المغناطيسية، والمحركات الكهربائية وكيفية عملها في الأنظمة المختلفة.''',
                style: TextStyle(fontSize: 16, color: textColor),
              ),
              const SizedBox(height: 20),

              // قسم الترانسفورمر
              _buildAccordion(
                  'الترانسفورمر (المحول الكهربائي)',
                  '''
المحول الكهربائي هو جهاز يستخدم لتحويل الجهد الكهربائي. يعمل بناءً على مبدأ الحث المغناطيسي، حيث يتم نقل الطاقة الكهربائية بين ملفين عبر المجال المغناطيسي. المحولات تستخدم على نطاق واسع في توزيع الطاقة الكهربائية.
''',
                  textColor),
              const SizedBox(height: 20),

              // قسم الدارات المغناطيسية
              _buildAccordion(
                  'الدارات المغناطيسية',
                  '''
الدائرة المغناطيسية تتضمن المواد المغناطيسية وتوجيه المجال المغناطيسي داخل هذه المواد. يمكن استخدام هذه الدارات في المحركات الكهربائية والمحولات.
''',
                  textColor),
              const SizedBox(height: 20),

              // قسم المحركات الكهربائية
              _buildAccordion(
                  'المحركات الكهربائية',
                  '''
المحرك الكهربائي هو جهاز يحول الطاقة الكهربائية إلى طاقة ميكانيكية باستخدام مبدأ الحث المغناطيسي. يستخدم المحرك المغناطيسيات والمجالات المغناطيسية لتحريك الأجزاء الميكانيكية.
''',
                  textColor),
              const SizedBox(height: 20),

              // فيديو توضيحي
              SectionTitle(title: 'الفيديو التوضيحي', textColor: textColor),
              ElevatedButton(
                onPressed: () {
                  // عرض الفيديو التوضيحي
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("فيديو توضيحي",
                            style: TextStyle(color: textColor)),
                        content: Text(
                            "رابط الفيديو يشرح مبادئ عمل الترانسفورمر والمحركات الكهربائية.",
                            style: TextStyle(color: textColor)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("إغلاق",
                                style: TextStyle(color: textColor)),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isDarkMode
                      ? Colors.blueGrey
                      : Colors.blue, // Use backgroundColor instead of primary
                  foregroundColor:
                      textColor, // Use foregroundColor instead of onPrimary
                ),
                child: Text('عرض الفيديو التوضيحي'),
              ),
              const SizedBox(height: 20),

              // اختبار تفاعلي
              SectionTitle(title: 'اختبر فهمك:', textColor: textColor),
              ElevatedButton(
                onPressed: () {
                  // الانتقال إلى صفحة الاختبار
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MotorQuizPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isDarkMode
                      ? Colors.blueGrey
                      : Colors.blue, // Use backgroundColor instead of primary
                  foregroundColor:
                      textColor, // Use foregroundColor instead of onPrimary
                ),
                child: Text('ابدأ الاختبار'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }

  // مكون Accordion لعرض المحتوى القابل للطي
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

// مكون لعنوان القسم
class SectionTitle extends StatelessWidget {
  final String title;
  final Color textColor;
  const SectionTitle({super.key, required this.title, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
    );
  }
}
