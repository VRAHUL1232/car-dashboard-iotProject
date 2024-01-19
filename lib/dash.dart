import 'package:carmodel/charts/section1.dart';
import 'package:carmodel/charts/section2.dart';
import 'package:carmodel/charts/section3.dart';
import 'package:carmodel/charts/section4.dart';
import 'package:carmodel/charts/section5.dart';
import 'package:carmodel/charts/section6.dart';
import 'package:carmodel/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Graphs'),
        // Add a hamburger icon to open the drawer
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _calculateCrossAxisCount(context),
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return DashboardCard(index + 1);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
    );
  }
}

  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth <= 600) ? 1 : 3; // Adjust the threshold as needed
  }

class DashboardCard extends StatelessWidget {
  final int sectionNumber;

  const DashboardCard(this.sectionNumber, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            _buildChart(context),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(BuildContext context) {
    switch (sectionNumber) {
      case 1:
        return Brac();
      case 2:
        return const BrakeChart();
      case 3:
        return LineChartWidget();
      case 4:
        return CornerChart();
      case 5:
        return const Steer();
      case 6:
        return const BrakePieChart();
      default:
        return Container();
    }
  }
}