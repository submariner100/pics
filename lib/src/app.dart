import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

// App State class
class App extends StatefulWidget {
  createState() {
return AppState();
  }
}
// Widget State class
class AppState extends State<App> {
int counter = 0;
List<ImageModel> images = [];

void fetchImage() async {
  counter++;
  final response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
  final imageModel = ImageModel.fromJson(json.decode(response.body));
  
  setState(() {
    images.add(imageModel);
  }); 
}

Widget build(context) {
return MaterialApp(
  home: Scaffold(
    body: ImageList(images),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: fetchImage,
    ),
    appBar: AppBar(
      title: Text('Lets see some images Michael!'),
    ),
  ),
);
  }
}
