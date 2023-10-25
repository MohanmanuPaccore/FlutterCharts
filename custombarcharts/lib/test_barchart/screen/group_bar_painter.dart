import 'dart:math';

import 'package:flutter/material.dart';


class GroupedBarChartPainter extends CustomPainter {
  List<List<double>>? groupData;
  List<String>? groupLabels;
  double? minimumBarWidth;
  double groupSpacing = 50; // Adjust the spacing between groups
  double bottomMargin = 30;
  double xAxisPadding = 0;
  double yAxisPadding = 20;
  double leftPadding = 5.0;
  double rightPadding = 5.0;
  double topPadding = 10.0;
  double bottomPadding = 3.0;
  double xLineStrokeWidth = 2.0;
  double yLineStrokeWidth = 2.0;
  double yAxisLabelPadding = 2;

  GroupedBarChartPainter(
      {this.groupData, this.groupLabels, this.minimumBarWidth = 20});

  // ... (Previous code remains the same)

  @override
  void paint(Canvas canvas, Size size) {
    final xLabelStyle = TextStyle(color: Colors.black, fontSize: 19);

    final numGroups = groupData?.length;
    final maxBarsInGroup =
        groupData?.map((group) => group.length).reduce((a, b) => a > b ? a : b);

    final totalBarSpacing = groupSpacing * (numGroups! - 2);
    final totalBarWidth =
        size.width - leftPadding - rightPadding - totalBarSpacing;
    final barWidth = (totalBarWidth / (numGroups * maxBarsInGroup!))
        .clamp(minimumBarWidth!, double.infinity);
    final maxData =
        groupData?.expand((group) => group).reduce((a, b) => a > b ? a : b);

    final xLabelY = size.height + 10.0;
    final xAxisStart = Offset(leftPadding, size.height - bottomMargin);
    final xAxisEnd =
        Offset(size.width - rightPadding, size.height - bottomMargin);

    final xLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    xLinePaint.strokeWidth = xLineStrokeWidth;

    final yLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    yLinePaint.strokeWidth = yLineStrokeWidth;

    // Draw the x-axis line
    canvas.drawLine(xAxisStart, xAxisEnd, xLinePaint);
    var getBarListLength = 0;
    // Calculate y-axis parameters
    final maxLabel = (maxData! / maxBarsInGroup).ceil();
    final yLabelInterval = maxLabel / maxBarsInGroup;
    final yLabelHeight =
        (size.height - xAxisPadding - bottomMargin) / maxBarsInGroup;
    double currentX = leftPadding;
    for (int groupIndex = 0; groupIndex < numGroups; groupIndex++) {
      getBarListLength = groupData![groupIndex].length;

      // Calculate the X-coordinate for the group label
      final groupLabel = groupLabels![groupIndex];

      final xLabelPainter = TextPainter(
        text: TextSpan(text: groupLabel, style: xLabelStyle),
        textDirection: TextDirection.ltr,
      );
      xLabelPainter.layout();

      final labelX =
          currentX + (barWidth * getBarListLength - xLabelPainter.width) / 2;
      xLabelPainter.paint(canvas, Offset(labelX, xLabelY - 30));
      double maxBarHeight = 0;
      for (int barIndex = 0;
          barIndex < groupData![groupIndex].length;
          barIndex++) {
        final barHeight = (groupData![groupIndex][barIndex] / maxData) *
            (size.height - xAxisPadding - bottomMargin);

        final groupOffset =
            groupIndex * (barWidth * maxBarsInGroup + groupSpacing) +
                barIndex * barWidth;

        final left = leftPadding + groupOffset;

        final leftWithPadding = currentX + leftPadding;

        final topWithPadding =
            size.height - barHeight - topPadding - bottomMargin;
        final rightWithPadding = currentX + barWidth - rightPadding;
        final bottomWithPadding = size.height - bottomPadding - bottomMargin;

        final rect = Rect.fromPoints(
          Offset(leftWithPadding, topWithPadding),
          Offset(rightWithPadding, bottomWithPadding),
        );

        final paint = Paint()..color = Colors.blue;
        currentX += barWidth;
        canvas.drawRect(rect, paint);
      }

      currentX += groupSpacing + (barWidth * numGroups * 0.2 - barWidth);
    }
  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
