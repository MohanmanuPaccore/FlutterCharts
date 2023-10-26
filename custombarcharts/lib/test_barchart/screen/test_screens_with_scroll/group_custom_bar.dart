import 'dart:math';

import 'package:flutter/material.dart';

import '../../../grouped_barchart/group_bar_painter.dart';

class GroupCustomBarCharts extends StatefulWidget {
  const GroupCustomBarCharts({super.key});

  @override
  State<GroupCustomBarCharts> createState() => _GroupCustomBarChartsTestState();
}

class _GroupCustomBarChartsTestState extends State<GroupCustomBarCharts> {
  final List<double> data =
      List.generate(50, (index) => Random().nextDouble() * 1000);

  double barwidth = 100;
  double groupSpacing = 300;

  //Group of bars
  List<List<double>> groupData1 = [
    [20.0, 30.0, 40.0, 50.0, 50.0, 70.0],
    [10.0, 25.0, 35.0, 50, 70],
    [15.0, 35.0, 45.0, 10],
    [15.0, 35.0, 45.0, 20],
    [
      15.0,
      35.0,
    ],
    [
      15.0,
    ],
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
    [15.0, 35.0, 45.0],
    [15.0, 35.0, 45.0],
  ]; // Category B

  List<List<double>> groupData = List.generate(40, (index) {
    List<double> innerList = List.generate(10, (innerIndex) {
      return (index * 10 + innerIndex).toDouble();
    });
    return innerList;
  });
  List<String> labels = List.generate(40, (index) {
    return 'Name ${index+1}'; // Generate names with an index, e.g., "Name 0", "Name 1", ...
  });
  List<String> labels1 = [
    'Group A',
    'Group B',
    'Group C',
    'Group D',
    'Group E',
    'Group F',
    'Group G',
    'Group H',
    'Group i',
    'Group j',
    'Group k',
    'Group l',
    'Group m',
    'Group n',
    'Group o',
    'Group p',
    'Group Q',
    'Group R',
    'Group S',
    'Group T',
    'Group U',
    'Group V',
    'Group W',
    'Group X',
    'Group Y',
    'Group Z',
    'Group 1',
    'Group 2',
    'Group 3',
    'Group 4',
    'Group 5',
    'Group 6',
    'Group 7',
    'Group 8',
    'Group 9',
    'Group 10',
    'Group 11',
    'Group 12',
  ];

  var barsLength = 0;
  var lastIndexLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < groupData.length; i++) {
      barsLength += groupData[i].length;
      if(i == groupData.last.length){
        lastIndexLength = groupData[i].length;
        debugPrint('lastIndexLength ----------------------------:$lastIndexLength');
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        final chartWidth = max(60.0 * data.length,
            constraints.maxWidth); // Ensure a minimum bar width of 50
        final chartHeight = constraints.maxHeight;

        return Stack(
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
                size: Size(
                    ((barwidth * 0.5) * (barsLength+1) +
                        (groupData.length) * groupSpacing +
                        barwidth * groupData.length / 2)+(100*(barwidth * 0.5)),
                    chartHeight),
                painter: GroupedBarChartPainter(
                    groupData: groupData,
                    groupLabels: labels,
                    minimumBarWidth: barwidth / 4,
                    groupSpacing: groupSpacing),
              ),
            ),
          ],
        );
      })),
    );
  }
}
