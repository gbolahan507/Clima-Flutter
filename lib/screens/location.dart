
import 'package:geolocator/geolocator.dart';

class Location {

double latitude;
double longitude;
 
//  Location({this.latitude, this.longitude});

 Future<void> getCurrentLocation()  async {
          try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    // here also the getCurrentLocatin also wait for Geolocator to finished its request. 
    latitude= position.latitude;
    longitude= position.longitude;
          }catch(e){
            print (e);
          }
 }
 }


 //     Summary

// This class is an abstract of the main file (LoadingScreen)
// the class passes two properties: the latitude and longitude 
// the class has one function that get the currentloction from the Geolocator packege added to the code
// the function is later called in the loading screen file...






