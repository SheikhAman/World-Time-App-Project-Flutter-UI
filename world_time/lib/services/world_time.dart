import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  late String time; //  the time in the location
  String flag; // url to  an  asset file location
  String url; // location  url for api endpoint
  late bool isDaytime; // true or false if daytime or not

// using named parameters in constructor
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // funtion will temprory return future , when async function will be  full  completed it will become void
    // // simulate network request for a username
    // String username = await Future.delayed(Duration(seconds: 3), () {
    //   // we can  assign value in await keyword
    //   return 'Sheikh';
    // });
    // // simulate network request to get bio of the username
    // String bio = await Future.delayed(Duration(seconds: 2), () {
    //   return 'vega, musician & egg colector';
    // });
    // print('$username - $bio');

// Used http package
    // Response response = await get(Uri.http('jsonplaceholder.typicode.com',
    //     '/todos/1')); // get constrctor a http dilam, response object a ta store holo
    // // print(response.body); // http object ke print korlam
    // Map data = jsonDecode(response // jsonDecode kore map a rakhlam
    //     .body); //  json is string representation of object(but its not  string)
    // print(data);
    // print(data['completed']);

// try catch  block is used to find out errors
    try {
      Response response = await get(Uri.http(
          'worldtimeapi.org', '/api/timezone/$url')); // make the request
      Map data = jsonDecode(
          response.body); // jsonDecode kore setake Map kore use korte parbo
      // print(data);

      // get  properties from data
      String datetime =
          data['datetime']; // grabing the value from Map using map[key]
      String offset = data['utc_offset'];
      offset = offset.substring(1, 3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(// datetime use korte hole parse korte hobe
          datetime); //created DateTimee() object , Datetime class, parse method of Datetime class, object/intance in now //  datatime parse kore dibe
      // DateTime.parse(datetime) //converts datetime into a date/time object

      now = now.add(Duration(
          hours: int.parse(
              offset))); // add  method  use kore Duration  a int.parse kore String ke integer korlam

      // set the time property
      // time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 20
          ? true
          : false; // time sokal 6ta ba 8ta r vitore hole sokal na hoi rat
// using package
      time = DateFormat.jm().format(now);
    } catch (e) {
      // error hole catch block  print korbe
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
