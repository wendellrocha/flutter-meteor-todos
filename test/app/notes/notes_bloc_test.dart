import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:note/app/app_module.dart';
import 'package:note/app/notes/notes_bloc.dart';
import 'package:note/app/notes/notes_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(NotesModule());
  NotesBloc bloc;

  // setUp(() {
  //     bloc = NotesModule.to.get<NotesBloc>();
  // });

  // group('NotesBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<NotesBloc>());
  //   });
  // });
}
