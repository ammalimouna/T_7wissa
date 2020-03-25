import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    Future _getCurrentUser() async {
      return FirebaseAuth.instance.currentUser(); 
    }      
                 return  Container(
                     child: Scaffold(
                       backgroundColor: Colors.purple[50],
                       /*Bar*/ 
                       appBar: AppBar(
                         title: Text('T''ahwissa'),
                         backgroundColor: Colors.white, 
                         elevation: 0.0,
            
                       ),
                       /*MENU*/ 
                       drawer: Drawer(
                           child: Column(
                         children: [
                           Expanded(
                             flex: 1,
                             child: SizedBox(
                                   height: 97,
                                   width: 97,
                                   child: Image(
                             image: AssetImage('assets/MOUNA.png'),
                              fit: BoxFit.contain,
                            ),
                                 ),
                           ),
                           Expanded(
                             flex: 2,
                             child: ListView(children: [
                               ListTile(
                                   leading: Icon(Icons.settings, color: Colors.greenAccent,),
                                   title: Text('Paramètres du compte'), 
                                 onTap: () async {
                                   Navigator.of(context).pop();
                                    
             
                                 },
                               ),
                               ListTile(
                                 leading: Icon(Icons.info,color: Colors.greenAccent, ),
                                 title: Text("Aide"),
                                 onTap: () {
                                   Navigator.of(context).pop();
                                 },
                               ),
                               ListTile(
                                 leading: Icon(Icons.share,color: Colors.greenAccent,),
                                 title: Text("Partager l'application"),
                                 onTap: () {
                                   Navigator.of(context).pop();
                                 },
                               ),
                               SizedBox(height: 12,), 
                               ListTile(
                                leading: Icon(Icons.done_outline, color: Colors.greenAccent,),
                                 title: Text("Déconnexion"),
                                 onTap: () async { 
                                  await _auth.signOut();            
                                 },
                               ),
                             ]),
                           )
                         ],
                       ),
                       ), 
                      )
                      
                         );
            //  } 
            }
      
        User _userFromFirebaseUser(FirebaseUser use) {
              return use != null ? User(uid: use.uid) : null;

        }
    
  }

