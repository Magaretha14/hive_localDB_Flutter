import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> ct = [];
  late Box<Contact> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('dbContact');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: ct.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(ct[index].name),
                subtitle: Column(
                  children: [Text(ct[index].email), Text(ct[index].phone)],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
