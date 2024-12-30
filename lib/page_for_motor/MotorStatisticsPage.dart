import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// الصفحة الرئيسية للإحصائيات
class MotorStatisticsPage extends StatefulWidget {
  const MotorStatisticsPage({super.key});

  @override
  _MotorStatisticsPageState createState() => _MotorStatisticsPageState();
}

class _MotorStatisticsPageState extends State<MotorStatisticsPage> {
  bool _isDarkMode = false;
  String _selectedType = 'كل المحركات';
  final List<String> _types = [
    'كل المحركات',
    'كهربائية',
    'احتراق داخلي',
    'هجينة'
  ];

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _isDarkMode ? Colors.black : Colors.white;
    Color appBarColor = _isDarkMode ? Colors.grey[900]! : Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: const Text('إحصائيات المحركات'),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
            onPressed: _toggleDarkMode,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: backgroundColor,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoPanel(),
              SizedBox(height: 20),
              Text(
                "توزيع أنواع المحركات",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              MotorTypesStatistics(),
              SizedBox(height: 20),
              Text(
                "كفاءة المحركات حسب النوع",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              EfficiencyChart(),
              SizedBox(height: 20),
              Text(
                "الإحصائيات والتوجهات في السوق",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              MarketTrendsChart(),
              SizedBox(height: 20),
              Text(
                "المصادر العلمية",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SourcesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// معلومات الإحصائيات العامة
class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoItem(title: "إجمالي عدد المحركات", value: "1,000,000"),
          InfoItem(title: "معدل الأعطال (شهريًا)", value: "50 حالة"),
          InfoItem(title: "متوسط الكفاءة", value: "80%"),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const InfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

// الرسم البياني لتوزيع الأنواع
class MotorTypesStatistics extends StatelessWidget {
  const MotorTypesStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('نوع المحرك')),
        DataColumn(label: Text('العدد')),
        DataColumn(label: Text('النسبة المئوية')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('كهربائية')),
          DataCell(Text('400,000')),
          DataCell(Text('40%')),
        ]),
        DataRow(cells: [
          DataCell(Text('احتراق داخلي')),
          DataCell(Text('300,000')),
          DataCell(Text('30%')),
        ]),
        DataRow(cells: [
          DataCell(Text('هجينة')),
          DataCell(Text('300,000')),
          DataCell(Text('30%')),
        ]),
      ],
    );
  }
}

// الرسم البياني للكفاءة
class EfficiencyChart extends StatelessWidget {
  const EfficiencyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 85),
                FlSpot(1, 87),
                FlSpot(2, 90),
                FlSpot(3, 88),
              ],
              isCurved: true,
              color: Colors.green,
              barWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}

// الرسم البياني للإحصائيات السوقية
// الرسم البياني للإحصائيات السوقية
class MarketTrendsChart extends StatelessWidget {
  const MarketTrendsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 0),
                FlSpot(1, 5),
                FlSpot(2, 15),
                FlSpot(3, 10),
                FlSpot(4, 20),
              ],
              isCurved: true,
              color: Colors.blue,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text("2020");
                    case 1:
                      return const Text("2021");
                    case 2:
                      return const Text("2022");
                    case 3:
                      return const Text("2023");
                    case 4:
                      return const Text("2024");
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
          ),
          borderData: FlBorderData(show: true),
        ),
      ),
    );
  }
}

// قسم المصادر
class SourcesSection extends StatelessWidget {
  const SourcesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }
}
