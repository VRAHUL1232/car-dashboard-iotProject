import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BrakePieChart extends StatefulWidget {
  const BrakePieChart({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BrakePieChartState createState() => _BrakePieChartState();
}

class _BrakePieChartState extends State<BrakePieChart> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 200,
      width: screenWidth*0.7,
      child: Stack(
        children: [
          // Use FlPieChart instead of LineChart
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: Colors.red,
                  value: 45,
                  title: '45%',
                  radius: 50,
                ),
                PieChartSectionData(
                  color: Colors.blue,
                  value: 9,
                  title: '9%',
                  radius: 50,
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: 14,
                  title: '14%',
                  radius: 50,
                ),
                PieChartSectionData(
                  color: Colors.yellow,
                  value: 32,
                  title: '32%',
                  radius: 50,
                ),
              ],
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Sudden Brake',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 30,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Low',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 60,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Medium',
                style: TextStyle(
                  color: Color.fromARGB(255, 201, 181, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 90,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'High', // Display the count for 'Brake 3'
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(int brakeValue) {
    // You can define your own color logic based on the brakeValue
    // For simplicity, I'm using a predefined color list
    List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.yellow,
    ];
    return colors[brakeValue % colors.length];
  }
}

void main() {
  runApp(const MaterialApp(
    home: BrakePieChart(),
  ));
}
