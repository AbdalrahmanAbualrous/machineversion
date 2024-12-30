import 'package:flutter/material.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('استفسارات'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'إذا كان لديك أي استفسار، يرجى كتابته هنا:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 6,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'اكتب استفسارك هنا',
                  hintText: 'اكتب استفسارك أو تعليقك...',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('تم إرسال الاستفسار'),
                      content:
                          const Text('شكرًا لاستفسارك، سوف نرد عليك قريبًا.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('موافق'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('إرسال الاستفسار'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
