import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/dog_api.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpDetails() async {
    DogApi instance = DogApi(inputBreedName: widget.name);
    await instance.getData();

    Navigator.pushReplacementNamed(context, '/details', arguments: {
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'lifespan': instance.lifeSpan,
      'temperament': instance.temperament,
      'imgUrl': instance.imgUrl
    });
  }

  @override
  void initState() {
    super.initState();
    setUpDetails();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xf8f8f8ff),
        body: Center(
            child: SpinKitSpinningLines(color: Color(0xFF284065), size: 50.0)));
  }
}
