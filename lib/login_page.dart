import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 bool isLoading = false;
 String? token;
   final _formKey = GlobalKey<FormState>();
  final   TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (
        (isLoading == true) ? Container(child: Center(
          child: CircularProgressIndicator(color: Colors.orange))) : Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: email, 
            decoration: InputDecoration(hintText: 'email'),// The validator receives the text that the user has entered.
            onSaved: (value) {
              email.text = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(hintText: 'password'),
            // The validator receives the text that the user has entered.
            onSaved: (value) {
              password.text = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if(value.length < 6) {
                'password length must be more than 6';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                 setState(() {
                   isLoading = !isLoading;
                 });
                 await  Provider.of<Products>(context,listen: false).signin(email.text.trim(), password.text.trim());
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                 setState(() {
                   isLoading = !isLoading;
                 });
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    ))
      
    );
  }
}