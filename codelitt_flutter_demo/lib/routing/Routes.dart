//Navigation class that contains static routes to the different screens


import 'package:codelitt_flutter_demo/screens/LocationScreen.dart';
import 'package:flutter/material.dart';

class Routes {
    static locationScreen(context) {
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => LocationScreen()));
    }
}