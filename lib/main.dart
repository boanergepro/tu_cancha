import 'package:flutter/material.dart';
import 'package:tu_cancha/src/app.dart';
import 'package:tu_cancha/src/data/db/db_connection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDb();

  runApp(const MyApp());
}