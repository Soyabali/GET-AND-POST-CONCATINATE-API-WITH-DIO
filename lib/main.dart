import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                fetchData();
              }, child: const Text("Get / Post Data"))
            ],
          ),
        ),
      ),
    );
  }
}
void fetchData() async{
  var dio = Dio();
  var response = await Future.wait(
      [
    dio.get('https://jsonplaceholder.typicode.com/posts/1'),
    dio.post('https://jsonplaceholder.typicode.com/posts')
      ]);
  print(response.length);
  print(response[0].data);
  print(response[1].data);
}