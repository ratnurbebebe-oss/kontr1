import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
  }
  class HomePage extends StatefulWidget {
  const HomePage({super.key,});
  @override
  State<HomePage> createState() => _HomePageState();
  }
  class _HomePageState extends State<HomePage> {
    String ? imageUrl;
    @override 
    void initState() {
      super.initState();
      getImage();
    }
    Future<void> getImage() async {
      final dio = Dio();
      final response = await dio.get('https://dog.ceo/api/breeds/image/random');
      setState(() {
        imageUrl = response.data['message'];
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dog images"),
        ),
        body: Center(
          child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageUrl == null
                  ? const CircularProgressIndicator()
                  : Image.network(imageUrl!),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: getImage,
                child: const Text("привет"),
              ),
            ],
          ),
        ),
      );
    }
  }
  