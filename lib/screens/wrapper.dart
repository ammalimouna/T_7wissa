import 'package:flutter/material.dart';
import 'package:projet_2cp/screens/authenticate/authenticate.dart';
import 'package:projet_2cp/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:projet_2cp/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}