import 'package:cnas/data%20classes/Demande.dart';
import 'package:cnas/data%20classes/ETS.dart';
import 'package:cnas/data%20classes/Patient.dart';

class Propostion {
  Propostion({
    required this.idProposition,
    required this.demande,
    required this.ets,
    required this.dateCreation,
    required this.etat,
  });
  late final String idProposition;
  late final Demande demande;
  late final ETS ets;

  late final String dateCreation;

  late final String etat;

  Propostion.fromJson(Map<String, dynamic> json){
    idProposition = json['id_proposition'];
    demande = json['demande'];
    ets = json['ets'];

    dateCreation = json['date_creation'];
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_proposition'] = idProposition;
    _data['demande'] = demande;
    _data['ets'] = ets;

    _data['date_creation'] = dateCreation;
    _data['etat'] = etat;
    return _data;
  }
}