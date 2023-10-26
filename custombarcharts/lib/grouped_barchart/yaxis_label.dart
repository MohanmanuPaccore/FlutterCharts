import 'package:flutter/material.dart';

class YaxisLabel extends CustomPainter{

   List<List<double>>? groupData;
   List<String>? groupLabels;
   double? minimumBarWidth;
   double? groupSpacing ; // Adjust the spacing between groups
   double? bottomMargin ;
   double? xAxisPadding ;
   double? yAxisPadding ;
   double? leftPadding ;
   double? rightPadding ;
   double? topPadding ;
   double? bottomPadding ;
   double? xLineStrokeWidth ;
   double? yLineStrokeWidth ;
   double? yAxisLabelPadding;
   double? leftLinePadding ;
   bool? isYAxisScrollable; // Separate left line padding
   Color? barColor;
   TextStyle? xAxisTextStyle;
   TextStyle? yAxisTextStyle;
   Color? xAxisLineColor;
   Color?yAxisLineColor;
  YaxisLabel({required this.groupData,required this.groupLabels,this.minimumBarWidth=20,this.groupSpacing=20,
  this.bottomMargin=30,this.xAxisPadding=0,
  this.yAxisPadding=20,this.leftPadding=10,
  this.rightPadding=5,this.topPadding=10,
  this.bottomPadding=2,this.xLineStrokeWidth=2.0,
  this.leftLinePadding=50.0,this.yAxisLabelPadding=5,
  
  this.yLineStrokeWidth=2.0,this.isYAxisScrollable=true,
  
  
  this.barColor,this.xAxisTextStyle,this.yAxisTextStyle,this.xAxisLineColor,this.yAxisLineColor
  });



@override
void paint(Canvas canvas, Size size) {
  final xLabelStyle = TextStyle(color: Colors.black, fontSize: 19);
  final numGroups = groupData?.length;
  final maxBarsInGroup =
      groupData?.map((group) => group.length).reduce((a, b) => a > b ? a : b);
  final totalBarSpacing = groupSpacing! * (numGroups! - 2);
  final totalBarWidth =
      size.width - leftPadding! - rightPadding! - totalBarSpacing;
  final barWidth = (totalBarWidth / (numGroups * maxBarsInGroup!))
      .clamp(minimumBarWidth!, double.infinity);
  final maxData =
      groupData?.expand((group) => group).reduce((a, b) => a > b ? a : b);
  final xLabelY = size.height + 10.0;
  final xAxisStart = Offset(leftLinePadding!, size.height - bottomMargin!);
  final xAxisEnd =
      Offset(size.width!+size.width, size.height - bottomMargin!);
  final xLinePaint = Paint()
    ..color =xAxisLineColor?? Colors.black
    ..style = PaintingStyle.fill;
  xLinePaint.strokeWidth = xLineStrokeWidth!;
  final yLinePaint = Paint()
    ..color =yAxisLineColor?? Colors.black
    ..style = PaintingStyle.fill;
  yLinePaint.strokeWidth = yLineStrokeWidth!;
  // Draw the x-axis line
  canvas.drawLine(xAxisStart, xAxisEnd, xLinePaint);
  var getBarListLength = 0;
  // Calculate y-axis parameters
  // final maxLabel = (maxData! / maxBarsInGroup).ceil();
  // final yLabelInterval = maxLabel / maxBarsInGroup;
  // final yLabelHeight =
  //     (size.height - xAxisPadding! - bottomMargin!) / maxBarsInGroup;
  // double currentX = leftPadding!;

final maxLabel = (maxData! / maxBarsInGroup).ceil();
  final yLabelInterval = maxLabel / maxBarsInGroup;
  final yLabelHeight = (size.height - xAxisPadding! - bottomMargin!) / maxBarsInGroup;
  double currentX = leftLinePadding!; // Use leftLinePadding as the starting point

  // Draw the y-axis line
  final yAxisStart = Offset(leftLinePadding!, topPadding!);
  final yAxisEnd = Offset(leftLinePadding!, size.height - bottomMargin!);
  canvas.drawLine(yAxisStart, yAxisEnd, yLinePaint);

  // Draw the y-axis labels
double minData = double.maxFinite;
double maxData1 = -double.maxFinite;


  // Draw the y-axis labels
for (final group in groupData!) {
  for (final value in group) {
    if (value < minData) {
      minData = value;
    }
    if (value > maxData1) {
      maxData1 = value;
    }
  }
}

// Calculate y-axis parameters
final yLabelInterval1 = (maxData1 - minData) / maxBarsInGroup;

for (int groupIndex = 0; groupIndex <= maxBarsInGroup; groupIndex++) {
  final labelY = size.height - topPadding! - (yLabelHeight * groupIndex);
  final yLabel = (minData + (yLabelInterval1 * groupIndex)).toInt();
  final yLabelPainter = TextPainter(
    text: TextSpan(text: yLabel.toString(), style:yAxisTextStyle?? xLabelStyle),
    textDirection: TextDirection.ltr,
  );
  yLabelPainter.layout();
  yLabelPainter.paint(
    canvas,
    Offset(
      leftLinePadding! - yLabelPainter.width - yAxisLabelPadding!,
      labelY - yLabelPainter.height / 2 -bottomMargin!,
    ),
  );

}


  for (int groupIndex = 0; groupIndex < numGroups; groupIndex++) {
    getBarListLength = groupData![groupIndex].length;
currentX += groupSpacing! + (barWidth * getBarListLength - barWidth);  }
}  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

