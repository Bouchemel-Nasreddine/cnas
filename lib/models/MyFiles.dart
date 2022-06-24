import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? title, totalDemandes;
  final int? numOfDemandes, percentage;
  final Color? color;

  CloudStorageInfo({
    this.title,
    this.totalDemandes,
    this.numOfDemandes,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Traitées",
    numOfDemandes: 1500,
    totalDemandes: "1000",
    color: primaryColor,
    percentage: 67,
  ),
  CloudStorageInfo(
    title: "Acceptées",
    numOfDemandes: 1500,
    totalDemandes: "500",
    color: Color(0xFFFFA113),
    percentage: 33,
  ),
  CloudStorageInfo(
    title: "Refusées",
    numOfDemandes: 1500,
    totalDemandes: "50",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "En attente",
    numOfDemandes: 1500,
    totalDemandes: "500",
    color: Color(0xFF007EE5),
    percentage: 33,
  ),
];
