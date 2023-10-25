import 'dart:math';

import 'package:custombarcharts/bar_chart.dart';
import 'package:flutter/material.dart';

class BarChartTest1 extends StatefulWidget {
  const BarChartTest1({super.key});

  @override
  State<BarChartTest1> createState() => _BarChartTest1State();
}

class _BarChartTest1State extends State<BarChartTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {

       return 
        Center(
          child: 
          BarChart(
            bars: [
              Bar(label: 'A', value: 100),
              Bar(label: 'B', value: 75),
              Bar(label: 'C', value: 150),
              Bar(label: 'D', value: 200),
              Bar(label: 'E', value: 50),
              Bar(label: 'F', value: 175),
              Bar(label: 'G', value: 175),
              Bar(label: 'H', value: 175),
              Bar(label: 'I', value: 175),
              Bar(label: 'J', value: 175),
              Bar(label: 'K', value: 175),
              Bar(label: 'L', value: 175),
              Bar(label: 'M', value: 175),
            ],
          ),
        );
      }
    )));
  }
}