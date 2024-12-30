import 'package:flutter/material.dart';

class MotorQuizPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'ما هو مبدأ عمل المحرك الكهربائي؟',
      'answers': ['التفاعل المغناطيسي', 'الاحتراق الداخلي', 'تخزين الطاقة'],
      'correct': 0,
    },
    {
      'question': 'ما هو المحرك الأكثر استخدامًا في السيارات الكهربائية؟',
      'answers': [
        'محرك التيار المستمر',
        'محرك التيار المتناوب',
        'محرك الاحتراق الداخلي'
      ],
      'correct': 1,
    },
    {
      'question': 'ما هو المحرك الذي يستخدم في التطبيقات الصناعية الثقيلة؟',
      'answers': ['محرك تيار متردد', 'محرك تيار مستمر', 'محرك دوار'],
      'correct': 0,
    },
  ];

  MotorQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختبار المحركات')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          var question = questions[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                question['question'],
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Column(
                children: List.generate(
                  question['answers'].length,
                  (i) => ElevatedButton(
                    onPressed: () {
                      // Check answer
                      if (i == question['correct']) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('إجابة صحيحة!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('إجابة خاطئة')),
                        );
                      }
                    },
                    child: Text(question['answers'][i]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
