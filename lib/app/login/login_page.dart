import 'package:enhanced_meteorify/enhanced_meteorify.dart';
import 'package:flutter/material.dart';
import 'package:note/main.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _user = '';
  String _pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _user = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'User',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _pass = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Pass',
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text('Login'),
                onPressed: (_user.length > 0 && _pass.length > 0)
                    ? () {
                        meteor.loginWithPassword(_user, _pass).catchError(
                          (err) {
                            if (err is MeteorError) {
                              print(err);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(err.details),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Dismiss'),
                                        onPressed: () {
                                          Navigator.of(context).pop(0);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        );
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
