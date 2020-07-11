
import 'package:http/http.dart' as http;
import 'dart:convert';


class Network {
  String url;
  Network({this.url}); 

  Future<dynamic> getData () async {
     http.Response response = await http.get(url);  // this is where the real url is been called but just inform of constructor then the object is now used at the weather.dart file

       // note the api used was dommy api bcos is a sample api..
       // now let use the actual api from the site
       // later when my own apiKey is generated from the website,
       // it change from demonn sample to api
      
       if (response.statusCode == 200){
         String result = response.body;
            var decode = jsonDecode(result);
  //           // the jsonDecode is set at dynamiic using var keryword bcos the jsonDecode dives out
  //           // differebt data type result which can be string, int, bool and so on
            // var weather = jsonDecode(result);
           return decode;
  }else{
         print(response.statusCode);
       }
       
  }

}
  

  /**
   *          SUMMARY
   * 
   */




//        Summary

// This class is an abstract of the main file (LoadingScreen)
// This class is called in the main file (LoadingScreen)
// This class has one properties (url), one constructor where the url is passed
// This class has one async function that get data from the url gotten from where we get our Api
     // inside the function, we have if statement that check for the status of the api or url
     // the jsonDecode is called in the if statement
// the class is later called in the main file (loadingScreen)