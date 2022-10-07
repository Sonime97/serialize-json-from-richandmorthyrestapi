import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather.dart';
import 'homepage.dart';
import 'login_page.dart';
class Auth extends StatefulWidget {
  const Auth({ Key? key }) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
    @override
  Widget build(BuildContext context) {
  String? _id = Provider.of<Products>(context).token;
  String? _email = Provider.of<Products>(context).email;
  
    return MaterialApp(
      home: ((_id == null && _email == null) ? LoginPage() : HomePage())
    );
  }
}