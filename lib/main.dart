import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kontr_1/dog/dog_cubit.dart';
import 'package:flutter_kontr_1/repository/repositori.dart';

import 'cubit/dog_cubit.dart';
import 'repository/dog_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DogCubit(dogRepository: DogRepository())..getDogImage(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog'),
      ),
      body: Center(
        child: BlocBuilder<DogCubit, String?>(
          builder: (context, imageUrl) {
            if (imageUrl == null) {
              return const CircularProgressIndicator();
            }

            return Image.network(imageUrl);
          },
        ),
      ),
    );
  }
}