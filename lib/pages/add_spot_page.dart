import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/payavisit_page.dart';

class AddSpotPage extends StatefulWidget {
  const AddSpotPage({Key key}) : super(key: key);

  @override
  State<AddSpotPage> createState() => _AddSpotPageState();
}

class _AddSpotPageState extends State<AddSpotPage> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(label, length) {
    return TextFormField(
      maxLength: length,
      decoration: InputDecoration(
          labelText: label, fillColor: Colors.black12, filled: true),
      validator: (String value) {
        if (value.isEmpty) {
          return label + ' is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
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
      decoration: InputDecoration(labelText: 'Password'),
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

  Widget _buildURL() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Image URL', fillColor: Colors.black12, filled: true),
      keyboardType: TextInputType.url,
      /*validator: (String value) {
        if (value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },*/
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calories'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white24,
      appBar: AppBar(title: Text("ADD NEW SPOT")),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.red,
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 70),
                _buildName('Name', 30),
                _buildName('Description', 200),
                _buildName('Location', 30),
                _buildURL(),
                SizedBox(height: 100),
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return null;
                    }

                    _formKey.currentState.save();

                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Colors.black,
                              content: Text(
                                "Your suggestion has been successfully submited. "
                                "Please, await for our team’s approval.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              actions: [
                                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  ElevatedButton(
                                    child: Text(
                                      "Close",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PayAVisitPage()),
                                    ),
                                  )
                                ])
                              ],
                            ));

                    /*print(_name);
                    print(_email);
                    print(_phoneNumber);
                    print(_url);
                    print(_password);
                    print(_calories);*/

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
