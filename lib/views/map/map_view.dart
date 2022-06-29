import 'package:cnas/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class MapVeiw extends StatefulWidget {
  MapVeiw({Key? key}) : super(key: key);

  late var mapController;
  LatLng? chosedLoc = null;
  String? chosedAdr = null;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  State<MapVeiw> createState() => _MapVeiwState();
}

class _MapVeiwState extends State<MapVeiw> {
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(SizeConfig.screenHeight * 0.1),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.02),
        ),
        clipBehavior: Clip.antiAlias,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(36.726278, 3.125857),
            zoom: 13.0,
          ),
          onTap: (crdnt) {
            widget.chosedLoc = crdnt;
            addMarkerOnTap(crdnt);
          },
          markers: widget.markers.values.toSet(),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF1045F7)),
            padding: MaterialStateProperty.all(
                EdgeInsets.all(MediaQuery.of(context).size.height * 0.03)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
        onPressed: () async {
          //await getAdresse(widget.chosedLoc!);
          Navigator.pop(context, {
            'adresse': 'dummy adresse',
            'lat': widget.chosedLoc!.latitude,
            'lon': widget.chosedLoc!.longitude,
          });
        },
        child: Text(
          "Confimer",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  addMarkerOnTap(LatLng crdnt) {
    widget.markers.clear();
    final MarkerId markerId = MarkerId("my_marker");

    final Marker marker = Marker(
      markerId: markerId,
      position: crdnt,
    );

    print("setting marker");
    setState(() {
      widget.markers[markerId] = marker;
    });
  }

  getAdresse(LatLng crdnt) async {
    try {
      print(crdnt);
      GeoData data = await Geocoder2.getDataFromCoordinates(
          latitude: crdnt.latitude,
          longitude: crdnt.longitude,
          googleMapApiKey: "AIzaSyDjrV7E0vKuafUAtuORHg94mYKLLm378xs");

      widget.chosedAdr = data.address;
    } on Exception catch (e) {
      print(e);
    }
  }
}
