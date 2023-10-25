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
            
            double barwidth=300;
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
                [15.0, 35.0, 45.0],
                [15.0, 35.0, 45.0],
                [15.0, 35.0, 45.0],
                [15.0, 35.0, 45.0],
                [15.0, 35.0, 45.0],
                [15.0, 35.0, 45.0],
                [15.0, 35.0, 45.0],
                [15.0, 35.0, 45.0],

              ]; // Category B


List<String> labels=['Group A', 'Group B', 'Group C',
               
               'Group D','Group E','Group F',
               'Group G','Group H','Group i','Group j','Group k','Group l','Group m','Group n','Group o','Group p'
               
               
               ];

var barsLength = 0;

@override
void initState() {
  // TODO: implement initState
  for (int i = 0; i < groupData.length; i++) {
    barsLength += groupData[i].length;
  }
  super.initState();
}

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
          //Single bar Items
          // child: CustomPaint(
          //   size: Size(chartWidth, chartHeight),
          //   painter: BarChartPainter(data),
          // ),
          child: CustomPaint(
            size: Size(barwidth * 20 + barsLength * 20, chartHeight),
            painter: GroupedBarChartPainter(
                groupData: groupData,
                groupLabels: labels,
                minimumBarWidth: barwidth / 4),
          ),
        
    ),
  ],
);
      })

),
    );
  }
}