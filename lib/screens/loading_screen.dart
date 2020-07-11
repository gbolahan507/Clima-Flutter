
import 'package:clima/screens/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


 const apiKey = "2353487d7f7d6c7cf20802d56f6c5089"; 


  


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // iniState is a function called at the very first time the stateful widget is been called..
  // therefore any function called in the initState is called at the very first time the screen of this page load
    // Location location = Location(); 
     // this line inport the code from location.dart file
  @override
  void initState() {      // part of state in the stateful widget that load imidiately this page load...therefore any pro[erties r method declare in it load first and once. 
    super.initState();
    getLocationData();  // note the code in the initState only run once. i.e at the very first time the page is called
  }

  // create an async funcion that return no value

  void getLocationData() async {
    // WeatherModel weatherModel = WeatherModel();  //  or
    var weather = await WeatherModel().getWeatherLocation();  // this since is only  use once in this screen // also is going to mark await since getWeatherLocation is a future method
      
        Navigator.push(context, MaterialPageRoute(builder: (context){  // the navigator here push from the loading screen to the location screen without any button,
         
         return LocationScreen(location: weather); // the constructor LoctionScreen allow us to use the result get fom weather at the location screen  
       
       
        }));
    
    // create a function that fetch data from online, i.e function that call the http;
          //  print(longitude);
          //  print (weather);
          //  print(main);
          //  print (pressure);
       }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: SpinKitFadingCircle(
         color: Colors.amberAccent,
         size: 50.0
       )

        )
    
    
    );
  }
}



//     summary of this page

//1. the main function here is "getLocationDta" which is called at the initState i.e  the state that load first when this page open
//  Two classes are created from this page to simplified the code from been complex
       //  class Location: which call for the current location of the user using the package Geolocator gotten from the package
       // class Network which monitor the data gotten from the url and APi used
       // the 'weather' object will be use somewhereelse in d code;
       // one of the package later added to the loading screen is the *FLUTTER SPINKIT* which indicate some spinning to show that some 
       // works are working in the background b4 the loading screen show
       // NOTE: the wheather object is needed in the location screen


       /**
        *           SUMMARY 2
        Location class was inported.
        getLocation method was called at the iniState.

        */