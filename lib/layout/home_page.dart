import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_localdb/layout/form_page.dart';

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
    ct = box.values.toList();
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: ct.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    ct[index].name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(ct[index].email), Text(ct[index].phone)],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
