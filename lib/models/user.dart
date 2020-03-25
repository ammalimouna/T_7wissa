
import 'package:cloud_firestore/cloud_firestore.dart';
class User {
  final String uid; 
  String nom; 
  String prenom; 
  String numtel; 
  String identifiant; 
  User({this.uid, this.nom, this.identifiant,
   this.prenom, this.numtel});
   
}

class UserData{
   final String uid; 
  String nom; 
  String prenom; 
  String numtel; 
  String identifiant; 
  UserData({this.uid, this.nom, this.identifiant,
   this.prenom, this.numtel});
}