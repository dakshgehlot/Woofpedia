import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:woofpedia/ui/details_text.dart';

class BreedDetails extends StatefulWidget {
  const BreedDetails({Key? key}) : super(key: key);

  @override
  State<BreedDetails> createState() => _BreedDetailsState();
}

class _BreedDetailsState extends State<BreedDetails> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: const Color(0xf8f8f8ff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        imageUrl: data['imgUrl'],
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Image(
                            image: AssetImage(
                                'assets/images/image-not-found-dog.jpg')),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data['name'],
                      style: const TextStyle(
                        color: Color(0xFF284065),
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    DetailsText(
                        text: "Height", weight: FontWeight.bold, size: 16),
                    DetailsText(
                        text: "Weight", weight: FontWeight.bold, size: 16),
                    DetailsText(
                        text: "Lifespan", weight: FontWeight.bold, size: 16),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DetailsText(
                        text: data['height'],
                        weight: FontWeight.w400,
                        size: 14),
                    DetailsText(
                        text: data['weight'],
                        weight: FontWeight.w400,
                        size: 14),
                    DetailsText(
                        text: data['lifespan'],
                        weight: FontWeight.w400,
                        size: 14),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: DetailsText(
                      text: data['temperament'],
                      weight: FontWeight.w400,
                      size: 14),
                ),
                const SizedBox(height: 50),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF284065)),
                    foregroundColor: const Color(0xFF284065),
                    textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Search again"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
