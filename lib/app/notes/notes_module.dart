import 'notes_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'notes_page.dart';

class NotesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NotesBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NotesPage()),
      ];

  static Inject get to => Inject<NotesModule>.of();
}
