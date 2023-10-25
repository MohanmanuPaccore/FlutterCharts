import 'dart:math';

import 'package:custombarcharts/chart_painter.dart';
import 'package:flutter/material.dart';

class BarChartTest2 extends StatefulWidget {
  const BarChartTest2({super.key});

  @override
  State<BarChartTest2> createState() => _BarChartTest2State();
}

class _BarChartTest2State extends State<BarChartTest2> {
    final List<double> data = List.generate(50, (index) => Random().nextDouble() * 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      LayoutBuilder(
      builder: (context, constraints) {
        final chartWidth = max(60.0 * data.length, constraints.maxWidth); // Ensure a minimum bar width of 50
        final chartHeight = constraints.maxHeight;

return 
         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //Single bar Items
          child: CustomPaint(
            size: Size(chartWidth, chartHeight),
            painter: BarChartPainter(data),
          ),
// child:            CustomPaint(
//             size: Size(barwidth*10+ groupData.length*100, chartHeight),
//             painter: GroupedBarChartPainter(
//               groupData: groupData,
//               groupLabels: labels
               


            );
      }
           ),

//         );

      
      ),
    );
  }
}