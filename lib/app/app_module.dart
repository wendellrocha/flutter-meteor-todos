import 'package:note/app/login/login_module.dart';
import 'package:note/app/notes/notes_module.dart';
import 'package:note/app/splash/splash_module.dart';

import 'app_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:note/app/app_widget.dart';
import 'package:note/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/notes', module: NotesModule()),
        Router('/splash', module: SplashModule()),
        Router('/login', module: LoginModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}