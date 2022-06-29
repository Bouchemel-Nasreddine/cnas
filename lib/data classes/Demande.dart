class Demande {
  Demande(
      {required this.idDemande,
      required this.idPatient,
      required this.ville,
      required this.dateCreation,
      required this.etat,
      required this.dateValidation,
      required this.dateDebut,
      required this.dateFin,
      required this.x_pat,
      required this.y_pat,
      required this.x_hop,
      required this.y_hop});
  late final String idDemande;
  late final String idPatient;
  late String ville;
  late String dateCreation;
  late String etat;
  late String? dateValidation;
  late String dateDebut;
  late String dateFin;
  late var x_pat;
  late var y_pat;
  late var x_hop;
  late var y_hop;
  late String adresse_patient;
  late String adresse_hospital;

  Demande.initialise();

  Demande.fromJson(Map<String, dynamic> json) {
    idDemande = json['id_demande'];
    idPatient = json['id_patient'];
    ville = json['ville'];
    dateCreation = json['date_creation'];
    etat = json['etat'];
    dateValidation = json['date_validation'];
    dateDebut = json['date_debut'];
    dateFin = json['date_fin'];
    x_pat = json['x_pat'];
    y_pat = json['y_pat'];
    x_hop = json['x_hop'];
    y_hop = json['y_hop'];
    adresse_patient = json['adresse_patient'];
    adresse_hospital = json['adresse_hospital'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_demande'] = idDemande;
    _data['id_patient'] = idPatient;
    _data['ville'] = ville;
    _data['date_creation'] = dateCreation;
    _data['etat'] = etat;
    _data['date_validation'] = dateValidation;
    _data['date_debut'] = dateDebut;
    _data['date_fin'] = dateFin;
    _data['x_pat'] = x_pat;
    _data['y_pat'] = y_pat;
    _data['x_hop'] = x_hop;
    _data['y_hop'] = y_hop;
    _data['adresse_patient'] = adresse_patient;
    _data['adresse_hospital'] = adresse_hospital;
    return _data;
  }
}
