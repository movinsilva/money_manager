import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/data/pie_chart_data.dart';

List<PieChartSectionData> getSections(Color themeColor) => PieData.data.asMap().map<int, PieChartSectionData>((index, data) {
  final value = PieChartSectionData(
    value: data.percent,
    color: themeColor,
    title: '${data.percent.toInt()}%',
    titleStyle: TextStyle(
      fontSize: 10,
    ),
    radius: 20,
    borderSide: BorderSide(color: data.color,width: 1),
    badgeWidget: Text("${data.name} \n     4510", style: TextStyle(color: data.color, fontSize: 11),),
    badgePositionPercentageOffset: 2.3
  );
  return MapEntry(index, value);

}).values.toList();