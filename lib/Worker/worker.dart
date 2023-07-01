import 'dart:convert';

import 'package:http/http.dart';

class worker
{
   //Constructor
   worker({required this.location})
   {
      location = this.location;
   }

   late String location;
   late String temp;
   late String humidity;
   late String wind_speed;
   late String description;
   late String main;
   late String icon;

   Future<void> getData() async
   {
      try{
         Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=601a61a33ee58deeb59712468fe13f0d"));
         Map data = jsonDecode(response.body);

         //Getting Temp,Humidity
         Map temp_data = data['main'];
         double getTemp = temp_data['temp'] - 273.15;
         String getHumidity = temp_data['humidity'].toString();

         //Getting Description
         List weather_data = data['weather'];
         Map weather_main_data = weather_data[0];
         String getMain_des = weather_main_data['main'];
         String getDesc = weather_main_data['description'];
         // print(icon);

         //Getting Wind Speed
         Map wind = data['wind'];
         double getWind_speed = wind['speed']/0.27777777777778;

         //Assigning Values
         temp = getTemp.toString();//C
         humidity = getHumidity;//%
         wind_speed = getWind_speed.toString();//km/hr
         description = getDesc;
         main = getMain_des;
         icon = weather_main_data["icon"].toString();
      }
      catch(e){
         temp = "NA";
         humidity = "NA";
         wind_speed = "NA";
         description = "No Data Found";
         main = "NA";
         icon  = "03d";
      }
   }
}