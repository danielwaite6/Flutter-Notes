import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  var notes = <String>["Primeiro Item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                  title: Text(notes[i]),
                  onTap: () async {
                    var response = await Navigator.pushNamed(
                      context,
                      "/create-note",
                      arguments: notes[i],
                    );
                    if (response != null) {
                      var description = response as String;
                      if (response.isEmpty) {
                        notes.removeAt(i);
                      } else {
                        notes[i] = description;
                      }

                      setState(() {});
                    }
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: OutlinedButton(
        onPressed: () async {
          var description = await Navigator.pushNamed(context, "/create-note");
          if (description != null) {
            notes.add(description as String);
            setState(() {});
          }
        },
        child: Text('Click Me'),
      ),
    );
  }
}
