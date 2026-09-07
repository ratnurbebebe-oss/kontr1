import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DogRepository {
  final Dio dio = Dio();

  Future<String> getDogImage() async {
    final response = await dio.get(
      'https://dog.ceo/api/breeds/image/random',
    );

    return response.data['message'];
  }
}