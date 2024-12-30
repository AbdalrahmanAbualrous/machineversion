import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  bool _isUpdated = false;

  final List<Map<String, String>> articles = [
    {
      'title': 'Understanding Electric Motors',
      'link':
          'https://www.electricalengineering101.com/understanding-electric-motors/',
      'summary': 'This article explains the basics of electric motors.'
    },
    {
      'title': 'Types of Electric Motors',
      'link': 'https://www.electrical4u.com/types-of-electric-motors/',
      'summary': 'A guide to the different kinds of electric motors available.'
    },
    {
      'title': 'Electric Motor Basics and Types',
      'link': 'https://www.engineeringchoice.com/electric-motor-types/',
      'summary': 'An introduction to the basics of electric motor types.'
    },
    {
      'title': 'Brushless DC Motors: How They Work',
      'link': 'https://www.industrial-electronics.com/bldc-motor.html',
      'summary': 'A detailed guide on how brushless DC motors operate.'
    },
    {
      'title': 'The Future of Electric Motors',
      'link': 'https://www.technologyreview.com/the-future-of-electric-motors/',
      'summary':
          'Exploring the future developments in electric motor technology.'
    },
    {
      'title': 'How Electric Motors Work',
      'link': 'https://www.explainthatstuff.com/how-electric-motors-work.html',
      'summary':
          'An in-depth explanation of the principles behind electric motors.'
    },
    {
      'title': 'The Evolution of Electric Motors',
      'link': 'https://www.energycentral.com/evolution-of-electric-motors',
      'summary': 'A historical look at the evolution of electric motors.'
    },
    {
      'title': 'Induction Motors: Types and Applications',
      'link': 'https://www.electricalengineering123.com/induction-motors/',
      'summary': 'An exploration of induction motors, their types, and uses.'
    },
    {
      'title': 'Modern Developments in Electric Motors',
      'link':
          'https://www.renewableenergyworld.com/modern-developments-in-electric-motors/',
      'summary':
          'Recent advancements in the field of electric motor technology.'
    }
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تعذر فتح الرابط: $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isUpdated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isUpdated = true;
        });
      });
    }

    // تحديد الألوان بناءً على الوضع (فاتح أو داكن)
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // اللون المناسب للنصوص في الوضع الداكن والفاتح
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final backgroundColor = isDarkMode
        ? Color(0xFF121212)
        : Colors.white; // خلفية داكنة في الوضع الداكن
    final cardColor =
        isDarkMode ? Color(0xFF333333) : Colors.white; // لون البطاقة في الوضعين

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("مقالات تعليمية للمحركات"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // أيقونة الرجوع
          onPressed: () {
            Navigator.of(context).pop(); // يرجع إلى الصفحة السابقة
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('المقالات التعليمية للمحركات', textColor),
          _buildArticleList(textColor, isDarkMode, cardColor),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildArticleList(Color textColor, bool isDarkMode, Color cardColor) {
    return Column(
      children: articles.map((article) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          elevation: 8,
          color: cardColor, // استخدام اللون المحدد للبطاقة
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: () {
              _launchURL(article['link']!);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['title']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    article['summary']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
