import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Les opérations ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Numero"),
                ),
                DataColumn(
                  label: Text("Prestataire"),
                ),
                DataColumn(
                  label: Text("Proposition"),
                ),
                 DataColumn(
                  label: Text("Distance"),
                ),
                 DataColumn(
                  label: Text("Ecart"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index]),
              ),
               
              
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.numero!)),
      DataCell(Text(fileInfo.prestataire!)),
      DataCell(Text(fileInfo.proposition!)),
      DataCell(Text(fileInfo.distance!)),
      DataCell(Text(fileInfo.ecart!)),
    ],
    
  );
  
}
 
 Color getRoleColor(String? ecart) {
  if (ecart == "10km") {
    return Colors.green;
  } else if (ecart == "TTTT") {
    return Colors.red;
  } else if (ecart == "Software Engineer") {
    return Colors.blueAccent;
  } else if (ecart == "Solution Architect") {
    return Colors.amberAccent;
  } else if (ecart == "Project Manager") {
    return Colors.cyanAccent;
  } else if (ecart == "Business Analyst") {
    return Colors.deepPurpleAccent;
  } else if (ecart == "UI/UX Designer") {
    return Colors.indigoAccent;
  }
  return Colors.black38;
}