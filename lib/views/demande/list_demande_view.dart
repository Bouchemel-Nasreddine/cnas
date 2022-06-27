import 'package:cnas/config/const.dart';
import 'package:cnas/config/size_config.dart';
import 'package:cnas/data%20classes/Demande.dart';
import 'package:cnas/models/patient_model.dart';
import 'package:cnas/views/demande/detail_demande.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart' as dio;

import '../../models/demandes_model.dart';

class ListDemande extends StatefulWidget {
  const ListDemande({Key? key}) : super(key: key);

  @override
  State<ListDemande> createState() => _ListDemandeState();
}

class _ListDemandeState extends State<ListDemande> {
  List<Demande> demandes = [];
  bool working = false;

  @override
  initState() {
    super.initState();
    getDemandes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: working
              ? const SizedBox(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: SizeConfig.screenWidth * 0.65,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: SizeConfig.screenWidth * (0.65 / 5),
                            child: Text("IdDemande",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1F2938)))),
                        Container(
                            alignment: Alignment.center,
                            width: SizeConfig.screenWidth * (0.65 / 5),
                            child: Text("Ville",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1F2938)))),
                        Container(
                            alignment: Alignment.center,
                            width: SizeConfig.screenWidth * (0.65 / 5),
                            child: Text("Déposé à",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1F2938)))),
                        Container(
                            alignment: Alignment.center,
                            width: SizeConfig.screenWidth * (0.65 / 5),
                            child: Text("Date limite",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1F2938)))),
                        Container(
                            alignment: Alignment.center,
                            width: SizeConfig.screenWidth * (0.65 / 5),
                            child: Text("statut",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1F2938)))),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenHeight * 0.02)),
                      clipBehavior: Clip.antiAlias,
                      height: SizeConfig.screenHeight * 0.9,
                      child: ListView.builder(
                        itemCount: demandes.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailDemande()),
                            );
                          },
                          child: Container(
                              child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Color(0xFFF6F6F6)))),
                            height: SizeConfig.screenHeight * 0.08,
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.screenWidth * (0.65 / 5),
                                    child: Text(demandes[index].idDemande,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF767676)))),
                                Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.screenWidth * (0.65 / 5),
                                    child: Text(demandes[index].ville,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF767676)))),
                                Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.screenWidth * (0.65 / 5),
                                    child: Text(demandes[index].dateCreation,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF767676)))),
                                Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.screenWidth * (0.65 / 5),
                                    child: Text(demandes[index].dateFin,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF767676)))),
                                Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.screenWidth * (0.65 / 5),
                                    color: lightYellow,
                                    child: Text(
                                      demandes[index].etat,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: yellow),
                                    )),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                  ]),
                ),
        ));
  }

  Future<void> getDemandes() async {
    setState(() {
      working = true;
    });
    final model = DemandeModel();
    dio.Response? response = await model.getDemandes();
    List<Demande> list = [];

    if (response == null) {
      showSnackBar(context: context, message: "erreur dans l'authentification");
      demandes = [];
      setState(() {
        working = false;
      });
      return;
    }

    if (response.statusCode == 200) {
      print(response.data);
      for (var d in response.data) {
        list.add(Demande.fromJson(d));
      }
      demandes = list;
    } else {
      showSnackBar(context: context, message: "erreur dans l'authentification");
    }

    setState(() {
      working = false;
    });
  }

  showSnackBar(
      {required BuildContext context,
      required String message,
      Duration duration = const Duration(seconds: 4)}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
