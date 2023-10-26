import 'dart:math';

import 'package:custombarcharts/grouped_barchart/group_bar_painter.dart';
import 'package:custombarcharts/grouped_barchart/yaxis_label.dart';
import 'package:flutter/material.dart';

class GroupBarChart extends StatefulWidget {
  bool? isYAxisScrollabel;
  double yAxisWidth;
   
   GroupBarChart({super.key,
   this.isYAxisScrollabel=false,
   this.yAxisWidth=60
   });

  @override
  State<GroupBarChart> createState() => _GroupBarChartTestState();
}

class _GroupBarChartTestState extends State<GroupBarChart> {
    final List<double> data = List.generate(50, (index) => Random().nextDouble() * 1000);
            
            double barwidth=300;
            //Group of bars
              List<List<double>> groupData = [
   
                [200.0, 300.0, 400.0,700.0,500.0,70.0],
                [100.0, 250.0, 350.0,50,70],
                [150.0, 350.0, 450.0,100],
                                [150.0, 350.0, 450.0,200],
                [150.0, 350.0, ],
                [150.0,],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],
                [150.0, 350.0, 450.0],

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

if(widget.isYAxisScrollabel??false){
  return        SingleChildScrollView(
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
           
           minimumBarWidth: barwidth / 4,

           
           
           ),
     ),
   
    );



}else{
    return 
    
    
    
      Stack(
  children: <Widget>[
    // CustomPaint(
    //   size: Size(barwidth * 10 + groupData.length * 100, chartHeight),
    //   painter: GroupedBarChartPainter(
    //     groupData: groupData,
    //     groupLabels: labels,
    //   ),
    // ),
       SizedBox(
  //color: Colors.red,
  width: widget.yAxisWidth,
child:CustomPaint(
              size: Size(barwidth * 20 + barsLength * 20, chartHeight),painter:YaxisLabel(
  groupData: groupData, groupLabels: labels,
) ,
  ),
),


       Container(
        margin: EdgeInsets.only(
        left: widget.yAxisWidth
        
        ),
         child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //Single bar Items
            // child: CustomPaint(
            //   size: Size(chartWidth, chartHeight),
            //   painter: BarChartPainter(data),
            // ),
            child: CustomPaint(
              size: Size(barwidth * 20 + barsLength * 20, chartHeight),
              painter: GroupedBarChartPainter(
                isYAxisScrollable: widget.isYAxisScrollabel,
                  groupData: groupData,
                  groupLabels: labels,
                  minimumBarWidth: barwidth / 4),
            ),
          
           ),
       ),



  ],
);

}

      
      })

),
    );
  }
}