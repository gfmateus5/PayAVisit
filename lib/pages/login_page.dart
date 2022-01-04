import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/payavisit_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Username', fillColor: Colors.white, filled: true),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _username = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email', fillColor: Colors.white, filled: true),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password', fillColor: Colors.white, filled: true),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      //appBar: AppBar(title: Text("ADD NEW SPOT")),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.red,
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Image.asset("assets/payavisit_cut.png"),
                SizedBox(height: 50),
                _buildName(),
                //_buildEmail(),
                _buildPassword(),
                SizedBox(height: 50),
                ElevatedButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return null;
                    }

                    _formKey.currentState.save();

                    return Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PayAVisitPage()),
                    );
                  },
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  child: Text(
                    "\nLogin as\nDinis 'A Pedra'\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PayAVisitPage()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
