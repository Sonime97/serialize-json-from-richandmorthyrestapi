import 'details.dart';
import 'dart:convert';
import 'user_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'weather_model.dart';

class Products with ChangeNotifier {
  String? _email;
  // var info;
  String? _token; 
  logout() {
    _token = null;
    _email = null;
    notifyListeners();
  }
  
  Future <void> signin(email,password) async {
   var endpoint =  'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDLE-IBOzyhFaNJg-sCUXDSez8IDTGeBjE';
   
  try{
final response = await http.post(Uri.parse(endpoint),
   body: json.encode({'email': email,'password': password,'returnSecureToken': true}));
   
   var data = await jsonDecode(response.body);
  print(data);
   var Details = UserDetails.fromJson(data);
   _token = Details.idToken;
   _email = Details.email;
   notifyListeners();
  } catch(e) {
    print('error occured');
  }
  // if(response.statusCode == '200 OK') {
   // var data = await jsonDecode(response.body);
   // var Details = UserDetails.fromJson(data);
   // _token = Details.idToken;
//    notifyListeners();
 //  }
  }
  Future getWeather() async {
    var name;
    var id;
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    // print(response.body);
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      var character = RichMorty.fromJson(data);

      name = Details(
          name: character.results.map((e) => e['name']).toList(),
          image: character.results.map((e) => e['image']).toList());
      // name =  character.results.map((element) => element['name']).toList();

      // Details(character.info, character.results);
      //id= character.id;
      notifyListeners();
      // var things = character.info;
      // print(character.name);

    }
    return name;

    //   print(character.results);

    // final weather = jsonDecode(response.body);
    // final info = Weather.fromJson(weather);
    //  print(info.data);

    // name = await info.searches[0];
    // print(name);
  }
  String? get token {
    return _token;
  }
   String? get email {
    return _email;
  }
}
