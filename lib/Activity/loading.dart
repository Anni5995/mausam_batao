import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam_batao/Worker/worker.dart';
import 'package:mausam_batao/Activity/home.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String temp;
  late String hum;
  late String wind_speed;
  late String des;
  late String main;
  late String icon;
  String location = "Bhubaneswar";

  void startApp(String location)async
  {
    worker instance = worker(location: location);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    wind_speed = instance.wind_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;


    Future.delayed(Duration(seconds: 1),() {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "wind_speed_value" : wind_speed,
        "des_value" : des,
        "main" : main,
        "icon_value" : icon,
        "location_value":location
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startApp(location);
  }

  @override
  Widget build(BuildContext context) {
    // List search = (ModalRoute.of(context)as dynamic).settings.arguments;
    // Map<String,dynamic> search = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    // final Map search = ModalRoute.of(context).settings.arguments;
    Map search = ModalRoute.of(context)?.settings.arguments as Map;
    // Map search = {};
    // search = ModalRoute.of(context)?.settings?.arguments as Map;
    // final search =(ModalRoute.of(context)!.settings.arguments as Map<dynamic,dynamic>);
    // final search = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    // final search = ModalRoute.of(context)?.settings.arguments as Map;
    if(search?.isNotEmpty ?? false)
    {
      location = search['searchText'];
    }
    startApp(location);
    return  Scaffold(
      body: SafeArea(
        child: Center (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/bgtrans.png",height: 200, width: 150,),
                Text("Mausam Batao", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),
                SizedBox(height: 15,),
                Text("Made by Aniket",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                SizedBox(height: 30,),
                SpinKitWave(
                  color: Colors.white,
                  size: 50.0,
                ),
              ],
            ),
        ),
      ),
          backgroundColor: Colors.brown[400],
    );
  }
}
