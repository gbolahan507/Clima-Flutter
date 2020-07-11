import 'package:clima/screens/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = "2353487d7f7d6c7cf20802d56f6c5089"; 
    var urll  =    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

   Future<dynamic> getCityName (String cityName) async {

     Network network = Network(url: '$urll?q=$cityName&appid=$apiKey&units=metric');
     var weather = await network.getData();
     return weather;
    


   }
  

  Future<dynamic> getWeatherLocation () async { 
  Location location = Location();

    await location.getCurrentLocation();  // this line called the function getCurrentLocation created in the Location class
      // Here, the *getLocation* is said to wait for *getCurrentLocation* to load finish bcos result get from *getCurrentLocation* is d one to be passed to *getLocation* method  
      // we need to await the result gotten from getcurrentlocation so as to make use of the result in the 
      // getLocation function
      // ideally we need to await the getcurrentlocation method, but we can only awaat a method that return future therfore
      // the void is turn to future.

       
        Network network = Network (url:'$urll?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'); // this line called the properties(url) created in the network class

        var weather = await network.getData(); // here 
        return weather;  // the return keyword is used bcos *weather* is the output result of this function
        // therefore the void is going to return a future dynamic type

  }
  String getWeatherIcon(int condition) {   // here two parameters are passed into the function
    if (condition < 300) {
      return '🌩';            // then the function return a string value
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
