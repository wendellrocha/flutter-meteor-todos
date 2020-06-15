import 'package:enhanced_meteorify/enhanced_meteorify.dart';
import 'package:flutter/material.dart';
import 'package:note/main.dart';

class NewNotePage extends StatefulWidget {
  final String title;
  const NewNotePage({Key key, this.title = "NewNote"}) : super(key: key);

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  String _text = '';

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
                  _text = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Text',
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text('Add'),
                onPressed: (_text.length > 0)
                    ? () {
                        meteor
                            .call('tasks.insert', [_text])
                            .then((value) => Navigator.of(context).pop())
                            .catchError(
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
