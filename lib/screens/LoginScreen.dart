import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormScreenState();
  }
}

class FormScreenState extends State<LoginScreen> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Name field required';
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'email',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'email field required';
        }
        if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
          return "Please enter a valid email address";
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
      decoration: InputDecoration(
        labelText: 'password',
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value.isEmpty) {
          return 'password field required';
        }
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildUrl() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Url',
      ),
      keyboardType: TextInputType.url,
      validator: (value) {
        if (value.isEmpty) {
          return 'Url field required';
        }
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Phone Number field required';
        }
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Calories',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        int calories = int.tryParse(value);
        if (calories == null || calories <= 0) {
          return 'Calories must be greater than zero';
        }
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yo bagus"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _buildUrl(),
                _buildPhoneNumber(),
                _buildCalories(),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                    child: Text(
                      'submit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () {
                      // if (!_formKey.currentState.validate()) {
                      //   return;
                      // }
                      // _formKey.currentState.save();

                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      print(_name);
                      print(_email);
                      print(_password);
                      print(_phoneNumber);
                      print(_url);
                    })
              ],
            )),
      ),
    );
  }
}
