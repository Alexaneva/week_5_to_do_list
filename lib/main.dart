import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Set<String> todo = {'Do home work\nBuy milk\nfeet the dog'};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: const Text('To do list'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 70, bottom: 10, left: 10, right: 10),
              child: TextField(
                style: const TextStyle(fontSize: 30),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write down your task',
                    hintStyle:
                        TextStyle(fontSize: 20, color: Colors.white70)),
                onChanged: (value) => setState(() {
                  Set newlist = todo.toSet();
                }),
                onSubmitted: (value) => setState(() {
                  todo.add(value);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todo.length,
                itemBuilder: ((BuildContext context, int index) {
                  return Text(
                      style: const TextStyle(fontSize: 25),
                      todo.elementAt(index));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
