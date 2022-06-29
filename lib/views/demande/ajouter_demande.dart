import 'package:cnas/config/size_config.dart';
import 'package:cnas/views/map/map_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data classes/Demande.dart';

class AjouterDemandeView extends StatefulWidget {
  const AjouterDemandeView({Key? key}) : super(key: key);

  @override
  State<AjouterDemandeView> createState() => _AjouterDemandeViewState();
}

Demande demande = Demande.initialise();
final debutController = TextEditingController();
final finController = TextEditingController();
final homeAdressController = TextEditingController();
final hospitalAdressController = TextEditingController();
final descriptionController = TextEditingController();

class _AjouterDemandeViewState extends State<AjouterDemandeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.05,
              right: SizeConfig.screenWidth * 0.05,
              top: SizeConfig.screenHeight * 0.03),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Créer une demande de transport sanitaire',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'date de début de transport',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.015,
                    ),
                    TextField(
                      controller: debutController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        hintText:
                            'indiquez la date de début de votre transport',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenHeight * 0.01),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'date de fin de transport',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.015,
                    ),
                    TextField(
                      controller: finController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        hintText: 'indiquez la date du fin de votre transport',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenHeight * 0.01),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'inquez votre l\'emplacement',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.015,
                    ),
                    InkWell(
                      onTap: () async {
                        Map<Object, Object?>? infos = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapVeiw()));
                        if (infos != null) {
                          demande.x_pat = infos['lat'];
                          demande.y_pat = infos['lon'];
                          demande.adresse_patient = infos['adresse'] as String;
                          setState(() {
                            homeAdressController.text = demande.adresse_patient;
                          });
                        }
                      },
                      child: TextField(
                        enabled: false,
                        controller: homeAdressController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.home),
                          hintText: 'indiquez votre l\'emplacement',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.screenHeight * 0.01),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'inquez l\'emplacement du votre établissement sanitaire',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.015,
                    ),
                    InkWell(
                      onTap: () async {
                        Map<Object, Object?>? infos = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapVeiw()));
                        if (infos != null) {
                          demande.x_pat = infos['lat'];
                          demande.y_pat = infos['lon'];
                          demande.adresse_hospital = infos['adresse'] as String;
                          setState(() {
                            hospitalAdressController.text =
                                demande.adresse_hospital;
                          });
                        }
                      },
                      child: TextField(
                        enabled: false,
                        controller: hospitalAdressController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.medical_services),
                          hintText:
                              'indiquez l\'emplacement de votre établissment sanitaire',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.screenHeight * 0.01),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'description',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.015,
                    ),
                    TextField(
                      controller: descriptionController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.description),
                        hintText: 'descrivez votre demande',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenHeight * 0.01),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF1045F7)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 15))),
                  onPressed: () {},
                  child: Text(
                    "Soumettre",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
