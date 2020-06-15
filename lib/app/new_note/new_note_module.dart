import 'new_note_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'new_note_page.dart';

class NewNoteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewNoteBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NewNotePage()),
      ];

  static Inject get to => Inject<NewNoteModule>.of();
}
