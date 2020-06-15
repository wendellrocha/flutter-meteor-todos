import 'package:enhanced_meteorify/enhanced_meteorify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:note/main.dart';
import 'package:note/models/task_model.dart';

class NotesPage extends StatefulWidget {
  final String title;
  const NotesPage({Key key, this.title = "Notes"}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  SubscriptionHandler _subscriptionHandler;
  List<Task> aux;
  var tasks;
  @override
  void initState() {
    super.initState();
    meteor.createCollection('tasks');
    _subscriptionHandler = meteor.subscribe('tasks', []);
  }

  @override
  void dispose() {
    super.dispose();
    _subscriptionHandler.stop();
  }

  @override
  Widget build(BuildContext context) {
    var sub = meteor.collections['tasks'];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: sub,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            List lista = snapshot.data.values.toList();
            var _doc = [];
            lista.forEach((item) {
              _doc.add(_obj(item['id'], item));
            });
            return _doc != null
                ? _tasks(_doc.reversed.toList(), context)
                : Container(child: Text('Sem notas'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/new-note');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _tasks(tasks, context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  child: _itemTask(tasks[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _itemTask(task) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.blueGrey,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  task['text'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  task['username'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _obj(id, item) {
    return {
      "id": id,
      "text": item['text'],
      "owner": item['owner'],
      "username": item['username']
    };
  }
}
