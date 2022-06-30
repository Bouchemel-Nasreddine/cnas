import 'package:cnas/config/const.dart';
import 'package:cnas/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart' as dio;
import '../../data classes/Transport.dart';
import '../../models/transport_model.dart';

class ListTransport extends StatefulWidget {
  const ListTransport({Key? key}) : super(key: key);

  @override
  State<ListTransport> createState() => _ListTransportState();
}

class _ListTransportState extends State<ListTransport> {
  List<Transport> transports = [];
  bool working = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: SizeConfig.screenWidth * 0.65,
            child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text("IdTrasnport",style: GoogleFonts.poppins(fontSize: 20 , fontWeight: FontWeight.w500 ,color: Color(0xFF1F2938)))),
                      Container(alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text("ETS" ,style: GoogleFonts.poppins(fontSize: 20 , fontWeight: FontWeight.w500 ,color: Color(0xFF1F2938)))),
                      Container(alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text("Date Debut",style: GoogleFonts.poppins(fontSize: 20 , fontWeight: FontWeight.w500 ,color: Color(0xFF1F2938)))),
                      Container(alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text("Date fin",style: GoogleFonts.poppins(fontSize: 20 , fontWeight: FontWeight.w500 ,color: Color(0xFF1F2938)))),
                      Container(alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text("Statut",style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500 ,color: Color(0xFF1F2938)))),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white ,
                        borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.02)
                    ),
                    clipBehavior: Clip.antiAlias,
                    height: SizeConfig.screenHeight * 0.9,
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) => Container(
                          child: Container(
                            alignment: Alignment.center ,
                            decoration: BoxDecoration(
                                border:  Border(
                                    bottom: BorderSide(width: 1 ,color:  Color(0xFFF6F6F6))
                                )
                            ),
                            height: SizeConfig.screenHeight * 0.08,
                            child: Row(
                              children: [
                                Container( alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text(transports[index].idTransport,style: GoogleFonts.poppins(fontSize: 14 , fontWeight: FontWeight.w500 ,color: Color(0xFF767676)))),
                                Container(alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text(transports[index].ets,style: GoogleFonts.poppins(fontSize: 14 , fontWeight: FontWeight.w500 ,color: Color(0xFF767676)))),
                                Container(alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text("Date Debut",style: GoogleFonts.poppins(fontSize: 14 , fontWeight: FontWeight.w500 ,color: Color(0xFF767676)))),
                                Container(alignment: Alignment.center,width : SizeConfig.screenWidth * (0.65/5),child: Text("Date fin",style: GoogleFonts.poppins(fontSize: 14 , fontWeight: FontWeight.w500 ,color: Color(0xFF767676)))),
                                Container(alignment: Alignment.center,width: SizeConfig.screenWidth * (0.65/5) ,color: lightYellow, child:
                                Text("Statut",style: GoogleFonts.poppins(fontSize: 14 , fontWeight: FontWeight.w500 ,color: yellow) ,)),
                              ],
                            ),
                          )),
                    ),
                  ),
                ]),
          ),
        ));
  }

  Future<void> getTransport() async {
    setState(() {
      working = true;
    });
    final model = TransportModel();
    dio.Response? response = await model.getTransport();
    List<Transport> list = [];

    if (response == null) {
      showSnackBar(context: context, message: "erreur dans la connexion");
      transports = [];
      setState(() {
        working = false;
      });
      return;
    }

    if (response.statusCode == 200) {
      print(response.data);
      for (var d in response.data) {
        list.add(Transport.fromJson(d));
      }
      transports = list;
    } else {
      showSnackBar(context: context, message: "erreur dans la connexion");
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
