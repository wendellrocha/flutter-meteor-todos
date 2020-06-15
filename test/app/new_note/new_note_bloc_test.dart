import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:note/app/app_module.dart';
import 'package:note/app/new_note/new_note_bloc.dart';
import 'package:note/app/new_note/new_note_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(NewNoteModule());
  NewNoteBloc bloc;

  // setUp(() {
  //     bloc = NewNoteModule.to.get<NewNoteBloc>();
  // });

  // group('NewNoteBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<NewNoteBloc>());
  //   });
  // });
}
