import 'package:flutter/material.dart';
import 'package:woofpedia/ui/breed_details.dart';
import 'package:woofpedia/ui/enter_breed.dart';
import 'package:woofpedia/ui/loading.dart';

void main() {
  runApp(MaterialApp(
    title: "Woofpedia",
    initialRoute: '/',
    routes: {
      '/': (context) => const EnterBreed(),
      '/details': (context) => const BreedDetails(),
      '/loading': (context) => const Loading(name: '')
    },
  ));
}
