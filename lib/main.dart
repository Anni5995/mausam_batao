import 'package:flutter/material.dart';
import 'package:mausam_batao/Activity/home.dart';
import 'package:mausam_batao/Activity/loading.dart';


void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
     "/loading" : (context) => Loading()
    },
  ));
}
