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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: getImage,
                child: const Text("Get New Image"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text("Go to Second Page"),
              ),
            ],
          ),
        ),
      );
    }
  }
  class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Second Page"),
      ),
      body: Center(
        child: Text("This is the second page."),
      ),
    );
  }
}