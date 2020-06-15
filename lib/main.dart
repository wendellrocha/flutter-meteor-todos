import 'package:enhanced_meteorify/enhanced_meteorify.dart';
import 'package:flutter/material.dart';
import 'package:note/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

Meteor meteor = Meteor.connect(url: 'http://192.168.88.209:3000');
void main() {
  runApp(ModularApp(module: AppModule()));
}
