import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz1/person_service.dart';
import 'package:quiz1/personlistmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class personDetail extends StatelessWidget {
  personDetail({required this.title, required this.url});
  String title;
  String url;
  PersonService personService = PersonService();
  String style = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: FutureBuilder(
        future: personService.getdata(url),
        builder: (context, AsyncSnapshot<Personmodel> snapshot) {
          if (snapshot.hasData) {
            Personmodel data = snapshot.data!;
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name: ${data.name}",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold)),
                    Text("Gender: ${data.gender}"),
                    Text("Height: ${data.height}"),
                    Text("Hair: ${data.hairColor}"),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: Color.fromARGB(255, 26, 230, 53),
                  rightDotColor: Color.fromARGB(255, 216, 22, 8),
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
