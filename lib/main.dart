
import 'package:flutter/material.dart';
import 'Auth.dart';
import 'package:provider/provider.dart';
import 'weather.dart';
void main() {
  
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products(),
      ),
      ],
      child: Auth()
      
    ),);
}
