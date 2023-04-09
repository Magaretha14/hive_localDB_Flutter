import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_localdb/layout/form_page.dart';
import 'package:hive_localdb/model/contact.dart';

import 'layout/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;

  await Hive.initFlutter();

  Hive.registerAdapter(ContactAdapter());

  await Hive.openBox<Contact>('dbContact');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPage(),
    );
  }
}
