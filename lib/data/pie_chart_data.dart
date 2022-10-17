import 'package:flutter/material.dart';

class PieData {

  static List<Data> data = [
    Data(name: 'Transportation', percent: 40, color: const Color(0xffff5182)),
    Data(name: 'Education', percent: 35, color: const Color(0xff53fdd7)),
    Data(name: 'Entertainment', percent: 25, color: Colors.deepOrangeAccent)
  ];


  static List<Data> dataa = [
    Data(name: 'Blue', percent: 40, color: const Color(0xff0293ee)),
    Data(name: 'Orange', percent: 30, color: const Color(0xfff8b250)),
    Data(name: 'Black', percent: 15, color: Colors.black),
    Data(name: 'Green', percent: 15, color: const Color(0xff13d38e)),
  ];
}

class Data {
  final String name;

  final double percent;

  final Color color;

  Data({required this.name, required this.percent, required this.color});
}