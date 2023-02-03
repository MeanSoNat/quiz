// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:quiz1/person_list_model.dart';
import 'package:quiz1/person_service.dart';
import 'package:quiz1/PersonDetail.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersonService personService = PersonService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color(0xFF00E5EE),
        leading: const Icon(
          Icons.person,
          size: 30,
          shadows: <Shadow>[
            Shadow(
                color: Colors.black12, blurRadius: 10.0, offset: Offset(2, 2))
          ],
        ),
        leadingWidth: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
        title: const Text(
          "Person",
          style: TextStyle(color: Colors.black38, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: personService.getPersonList(),
        builder: (context, AsyncSnapshot<PersonList> snapshot) {
          if (snapshot.hasData) {
            PersonList lists = snapshot.data!;
            return ListView(
              children: lists.results!
                  .map((PersonListItem e) => ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => personDetail(
                                title: e.name!,
                                url: e.url!,
                              ),
                            ),
                          );
                        },
                        title: Text(
                          e.name!,
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway'),
                        ),
                      ))
                  .toList(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: const Color(0xFFEA3799),
                  size: 100,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
