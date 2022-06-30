import 'package:cnas/config/size_config.dart';
import 'package:cnas/data%20classes/Patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as dio;
import '../../../models/patient_model.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
   Patient? patient ;
  bool working = false;
  final FocusNode myFocusNode = FocusNode();
  bool _status =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPatient();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
          child:  working
              ? const Center(
            child: CircularProgressIndicator(),
          )
              :
          new Container(
            height: SizeConfig.screenHeight * 0.9,
            color: Colors.white,
            child: new ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new Container(
                      color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Personal Information',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Nom',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new Text(patient!.lastName

                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Prenom',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new Text(
                                        patient!.firstName
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'NSS',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new Text(
                                        patient!.nss
                                      ),
                                    ),
                                  ],
                                )),



                                  ],
                                )),

                        ),


                  ],
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Future<void> getPatient() async {
    setState(() {
      working = true;
    });
    final model = PatientModel();
    dio.Response? response = await model.getPatient();


    if (response == null) {
      showSnackBar(context: context, message: "erreur dans la connexion");

      setState(() {
        working = false;
      });
      return;
    }

    if (response.statusCode == 200) {
      print(response.data);
      var d = response.data ;
      patient  =  Patient.fromJson(d);
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