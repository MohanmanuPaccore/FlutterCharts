import 'dart:math';

import 'package:custombarcharts/test_barchart/screen/group_bar_painter.dart';
import 'package:flutter/material.dart';

class GroupBarChartTest extends StatefulWidget {
  const GroupBarChartTest({super.key});

  @override
  State<GroupBarChartTest> createState() => _GroupBarChartTestState();
}

class _GroupBarChartTestState extends State<GroupBarChartTest> {
    final List<double> data = List.generate(50, (index) => Random().nextDouble() * 1000);
            
            double barwidth=100;
            //Group of bars
              List<List<double>> groupData = [
   
                [20.0, 30.0, 40.0,50.0,50.0,70.0],
                [10.0, 25.0, 35.0,50,70],
                [15.0, 35.0, 45.0,10],
                                [15.0, 35.0, 45.0,20],
                [15.0, 35.0, ],
                [15.0,],
                [15.0, 35.0, 45.0],
                [15.0, 35.0, 45.0],

              ]; // Category B


List<String> labels=['Group A', 'Group B', 'Group C',
               
               'Group D','Group E','Group F',
               'Group G','Group H'
               
               
               ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      
      
      LayoutBuilder(
      builder: (context, constraints) {
        final chartWidth = max(60.0 * data.length, constraints.maxWidth); // Ensure a minimum bar width of 50
        final chartHeight = constraints.maxHeight;
      
    return   Stack(
  children: <Widget>[
    // CustomPaint(
    //   size: Size(barwidth * 10 + groupData.length * 100, chartHeight),
    //   painter: GroupedBarChartPainter(
    //     groupData: groupData,
    //     groupLabels: labels,
    //   ),
    // ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: barwidth * 10 + groupData.length * 100, // Adjust the width as needed
        child: CustomPaint(
          size: Size(barwidth * 10 + groupData.length * 100, chartHeight),
          painter: GroupedBarChartPainter(
            groupData: groupData,
            groupLabels: labels,
            isYAxisScrollable: false, // Disable Y-axis scrolling
          ),
        ),
      ),
    ),
  ],
);
      })

),
    );
  }
}