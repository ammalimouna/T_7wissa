import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference utilisateurCollection = Firestore.instance.collection('utilisateur');

  Future<void> updateUserData(String identifiant, String numtel, String nom, String prenom ) async {
    return await utilisateurCollection.document(uid).setData({
      'nom': nom,
      'prenom' :prenom, 
      'identifiant' :identifiant, 
      'numtel': numtel,
    });
  }

}