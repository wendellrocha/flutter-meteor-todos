import 'package:enhanced_meteorify/enhanced_meteorify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:note/app/login/login_page.dart';
import 'package:note/app/notes/notes_page.dart';
import 'package:note/app/splash/splash_page.dart';
import 'package:note/main.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<DDPConnectionStatus>(
        stream: meteor.status(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.connected) {
              return StreamBuilder<Map<String, dynamic>>(
                stream: meteor.user(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NotesPage();
                  }
                  return LoginPage();
                },
              );
            }
            return SplashPage();
          }
          return Container(
            child: Text('Conectando ao meteor'),
          );
        },
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
