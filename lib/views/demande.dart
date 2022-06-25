import 'package:cnas/config/size_config.dart';
import 'package:cnas/viewmodels/patient_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemandesView extends StatefulWidget {
  const DemandesView({Key? key}) : super(key: key);

  @override
  State<DemandesView> createState() => _DemandesViewState();
}

class _DemandesViewState extends State<DemandesView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<PatientViewModel>(
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.8,
              width: SizeConfig.screenWidth * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenHeight * 0.05),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.8,
              width: SizeConfig.screenWidth * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenHeight * 0.05),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => value.getPatients(),
                child: Text('hi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
