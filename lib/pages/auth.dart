import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<AuthPage> {
  String _emailValue;
  String _senhaValue;
  bool _keepSession = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'E-mail'),
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  _senhaValue = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Keep Session'),
              value: _keepSession,
              onChanged: (bool value) {
                setState(() {
                  _keepSession = value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Login'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/products');
              },
            ),
          ],
        ),
      ),
    );
  }
}
