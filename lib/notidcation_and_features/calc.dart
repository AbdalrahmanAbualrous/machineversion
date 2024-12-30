import 'package:flutter/material.dart';

class MotorCalculationPage extends StatefulWidget {
  const MotorCalculationPage({super.key});

  @override
  _MotorCalculationPageState createState() => _MotorCalculationPageState();
}

class _MotorCalculationPageState extends State<MotorCalculationPage> {
  final TextEditingController powerController = TextEditingController();
  final TextEditingController torqueController = TextEditingController();
  String result = '';

  void calculate() {
    double power = double.tryParse(powerController.text) ?? 0.0;
    double torque = double.tryParse(torqueController.text) ?? 0.0;

    if (torque != 0) {
      double speed = (power * 1000) / torque; // سرعة المحرك (RPM)
      setState(() {
        result = "السرعة المحسوبة: ${speed.toStringAsFixed(2)} RPM";
      });
    } else {
      setState(() {
        result = "العزم لا يمكن أن يكون صفرًا!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حسابات المحرك')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: powerController,
              decoration: const InputDecoration(
                labelText: 'القدرة (kW)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: torqueController,
              decoration: const InputDecoration(
                labelText: 'العزم (Nm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: const Text('احسب'),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
