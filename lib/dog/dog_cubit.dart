
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kontr_1/repository/repositori.dart';

class DogCubit extends Cubit<String?> {
  final DogRepository dogRepository;
  DogCubit({ required this.dogRepository}) : super(null);
Future<void> getDogImage() async {
    final imageUrl = await dogRepository.getDogImage();
    emit(imageUrl);
  }
}