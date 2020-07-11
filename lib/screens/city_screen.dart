import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  WeatherModel weatherModel = WeatherModel();

  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () 
                  {

                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.grey),
                  onChanged: (value){
                cityName = value;
                  
                  },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.purple,
                  hintText: 'enter location',
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
                  icon: Icon(Icons.location_city),
                  
                ),

                )
              ),
              FlatButton(
                onPressed: () async {
                  Navigator.pop(context, cityName); // here data is passing backward, the context is the current file we are,
                  // the cityName is the data we want to get after the screen has beeen pop of....therefor the location typed is going to be the output of typeNamed


                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
