import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? title;
  final int? count;
  final Color? color;

  CloudStorageInfo({
    this.title,
    this.count,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Personas en el mall",
    count:20
  ),
  CloudStorageInfo(
    title: "Puerta 1",
    count: 30
  ),
  CloudStorageInfo(
    title: "Puerta 2",
    count: 20
  ),
  CloudStorageInfo(
    title: "Puerta 3",
    count: 29
  ),
];