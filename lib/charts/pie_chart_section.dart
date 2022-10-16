import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/data/pie_chart_data.dart';

List<PieChartSectionData> getSections() => PieData.data.asMap().map<int, PieChartSectionData>((index, data) {
  final value = PieChartSectionData(
    value: data.percent,
    color: Colors.black,
    title: '${data.percent.toInt()}%',
    titleStyle: TextStyle(
      fontSize: 10,
    ),
    radius: 30,
    borderSide: BorderSide(color: data.color,width: 0.5),
    badgeWidget: Text("${data.name} \n   4510", style: TextStyle(color: data.color, fontSize: 11),),
    badgePositionPercentageOffset: 1.7
  );
  return MapEntry(index, value);

}).values.toList();