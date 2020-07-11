import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {  // LocationScreen object 

  final  location;  

  LocationScreen ({this.location});  // constructor created to tap the object of weather from loading screen.dart

// Since our result is acess in the LocationScreen object but is needed in the buildcontext inside the LocationScreenState object.
// How do we tap into the LocationScreen onject to make it usable for us.
// note to tap to it, there is stateful widget properties called *widget*;


  @override
  _LocationScreenState createState() => _LocationScreenState();
}
  
 
class _LocationScreenState extends State<LocationScreen> {  // LocationScreenState object

    WeatherModel weatherModel = WeatherModel();


int temperature;   // int is used here bcos it has been converted to integer with toInt() method;
String weatherIcon;   // String is use here bcos is d data type returned in weathere.dart
String cityName;
String weatherMessage;
 
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.location);  // here the widget is been used to acees to the LocationScreen onject ..... nice one to flutter
    
  }

  void updateUI (decode) {
    setState(() {
      
    
      
    if (decode == null){
      temperature = 0;
      weatherIcon = 'error';
      weatherMessage ='unable to fetch location';
      return;
    }
    var temp =decode['main']['temp']; // convert the temp result from double to integer
    temperature = temp.toInt();   // conversion from doule to int
     var condition = decode['weather'][0]['id']; 
     weatherIcon = weatherModel.getWeatherIcon(condition);
     weatherMessage = weatherModel.getMessage(temperature);  // here temperature is passed into the getMessage

     cityName = decode['name'];  
    
    print('$temperature'); //here temperature printed out is in kelvin,  now convert it to celcius
    // note from the doc, temp can return as metric or imperial unit
    // since our temp is nedded in metric, therefoere add the unit to the url
    });
    
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var decode = await weatherModel.getWeatherLocation();
                      updateUI(decode);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typeNamed = await Navigator.push(context, MaterialPageRoute(builder: (context){
                    return CityScreen();
                    // here the result from the cityscrren serve as the output of the variable typeNamed.
                      }));
                      print(typeNamed);
                      if (typeNamed != null)  {
                        var weather = await weatherModel.getCityName(typeNamed);
                        updateUI(weather);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°', // here the temperauture is printed out using dollar sign infront of it.
                      style: kTempTextStyle, 
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




          //  int longitude =decode['coord']['lon'];    // here the var was used but later change to the result data type which happen to be
          //  String weather = decode[0]['icon'];  // same as one
          //  var main = decode['main']['humidity']; // same as one
          //  bool pressure = main.pressure;
          // NOTE: anytime our widget depend on properties to change the UI 
          //if we are using propertiees to update the state of our widget i.e what has to display on the screen..
          //then inorder for the properties to reflect on the screen the we wrap the properties with setState
          // for instance the temp,weatherIcon cityName are all wrap in the setState widget....

// 