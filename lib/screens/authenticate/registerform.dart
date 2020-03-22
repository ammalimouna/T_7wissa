import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/screens/authenticate/register.dart';


class RegisterForm extends StatefulWidget {

  final Function toggleView;
  RegisterForm({ this.toggleView });

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
class _RegisterFormState extends State<RegisterForm> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); //pour identifier le formulaire 
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  // text field state
  String nom= '';
    String email= '';
String password='';
  String prenom = '';
  String utilisateur = '';
  String error ='';
  String phoneNumber;
String phoneIsoCode;
int _currentStep=0; 
/*void onPhoneNumberChange(String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
       phoneNumber = number;
       phoneIsoCode = isoCode;
    });
} */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    
      
     body: Center(
       child: Form(
          key: _formKey,
          child: Stepper(
       type: StepperType.horizontal,
         steps: _mySteps(),
         
         currentStep: this._currentStep,
         onStepTapped: (step){
           setState(() {
             this._currentStep= step; 
           });
         },
         onStepContinue: (){

           setState(() {
             if(_formKey.currentState.validate() && _currentStep < _mySteps().length)
              this._currentStep=this._currentStep+1; 
              else{
                  setState(()=> error = 'Oups il faut tout remplir ! ' );

              if(this._currentStep==2)
                print('On envoie un email'); 
              }
           });
         },
         onStepCancel: (){
           setState(() {
              if(this._currentStep >0 )
             this._currentStep=this._currentStep-1; 
             else
               this._currentStep=0; 
           });
          
         },
      ), ), 
       
      ),
        
         
    );
  }
  List<Step> _mySteps(){
    List<Step> _steps= [
      Step(
        title: Text('Etape 1 '),
        
        content:Column(children: <Widget>[
          /*Champs Nom*/ 
              Material(
                elevation: 4,
                 borderRadius: BorderRadius.circular(30.0),
                child: 
                TextFormField(
                    obscureText: false,
                    //TEXT 
                   style: TextStyle(
                      color:  Colors.grey[900], 
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                    ), 
                    //SHAPE
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Nom",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  //Validation de l'entrée 
                  validator: (val) => val.isEmpty ? 'Entrez votre nom' : null,
                  onChanged: (val) {
                  setState(() => nom = val);
                },
              ),
              ), 
            
              SizedBox(height: 12),
              /*Champs Prenom*/ 
              Material(
                elevation: 4,
                 borderRadius: BorderRadius.circular(30.0),
                child: 
                TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    //TEXT 
                   style: TextStyle(
                      color:  Colors.grey[900], 
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                    ), 
                    //SHAPE
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Prenom",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  //Validation de l'entrée 
                  validator: (val) => val.isEmpty ? 'Entrez votre prénom' : null,
                  onChanged: (val) {
                  setState(() => prenom = val);
                },
              ),
              ), 
                 SizedBox(height: 12),
              /*Champs Numtle*/ 
              Material(
                elevation: 4,
                 borderRadius: BorderRadius.circular(30.0),
                child: 
                TextFormField(
                    obscureText: false,
                   keyboardType: TextInputType.emailAddress,

                    //TEXT 
                   style: TextStyle(
                      color:  Colors.grey[900], 
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                    ), 
                    //SHAPE
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  //Validation de l'entrée 
                  validator: (val) => val.isEmpty ? 'Entrez votre email' : null,
                  onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              ), 
                 SizedBox(height: 12),
              /*Champs Numtle*/ 
              Material(
                elevation: 4,
                 borderRadius: BorderRadius.circular(30.0),
                 
                child: 
                TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    //TEXT 
                   style: TextStyle(
                      color:  Colors.grey[900], 
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                    ), 
                    //SHAPE
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Numéro de téléphone",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  //Validation de l'entrée 
                  validator: (val) => val.isEmpty ? 'Entrez votre numéro de téléphone' : null,
                  onChanged: (val) {
                  setState(() => phoneNumber = val);
                },
              ),
              ), 
        ],), 
        isActive: _currentStep >=0,  ),
        Step(
        title: Text('Etape 2'),
        content:Column(children: <Widget>[
           /*Champs nom d'utilisateur*/ 
             SizedBox(height: 76),
              Material(
                elevation: 4,
                 borderRadius: BorderRadius.circular(30.0),
                child: 
                TextFormField(
                  
                    obscureText: false,
                    //TEXT 
                   style: TextStyle(
                      color:  Colors.grey[900], 
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                    ), 
                    //SHAPE
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Nom d'utilisateur",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  //Validation de l'entrée 
                  validator: (val) => val.isEmpty ? 'Entrez un nom d''utilisateur'  : null,
                  onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              ),
              
            /*Champs Email*/ 
              SizedBox(height: 12.0),
            /*Champs Mot de passe*/ 
              Material(
                elevation: 4,
                 borderRadius: BorderRadius.circular(30.0),
                 color: Colors.white,
                child : 
                 TextFormField(
                obscureText: true,
                    //TEXT 
                   style: TextStyle(
                      color:  Colors.grey[900], 
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                    ), 
                    //SHAPE
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Mot de passe",
                        suffixIcon: Icon (
                            Icons.remove_red_eye, 
                            color:  Colors.teal[800],
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), )
                  ),
                  //Validation de l'entrée
                controller: _pass,
                validator: (val) => val.length < 6 ? 'Mot de passe invalide' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              ),
            /*Champs Mot de passe*/
            SizedBox(height: 12),
            /*Champs Confirmation Mot de passe*/ 
              Material(
                elevation: 4,
                 borderRadius: BorderRadius.circular(30.0),
                child : 
                 TextFormField(
                obscureText: true,
                    //TEXT 
                   style: TextStyle(
                      color:  Colors.grey[900], 
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                    ), 
                    //SHAPE
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Confirmez le mot de passe",
                        suffixIcon: Icon (
                            Icons.remove_red_eye, 
                            color:  Colors.teal[800],
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                  ),
                  controller: _confirmPass,
                  //Validation de l'entrée
                  validator: (val){
                              if(val.isEmpty)
                                   return 'Empty';
                              if(val != _pass.text)
                                   return 'Not Match';
                              return null;
                              }, 
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              ),
            /*Champs Confirmation Mot de passe*/ 
        ],),
        isActive: _currentStep >=1,  ),
        Step(
        title: Text('Etape 3 '),
        content:Text('Un email de validation vous est envoyé, veuillez vérifier votre boite mail'),
        isActive: _currentStep >=2,  ),
    ]; 
    return _steps; 
  }
}