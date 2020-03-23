import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference utilisateurCollection = Firestore.instance.collection('utilisateur');

  Future<void> updateUserData(String nom, String prenom, String identifiant, String numtel) async {
    return await utilisateurCollection.document(uid).setData({
      'nom': nom,
      'prenom' :prenom, 
      'identifiant' :identifiant, 
      'numtel': numtel,
    });
  }

}