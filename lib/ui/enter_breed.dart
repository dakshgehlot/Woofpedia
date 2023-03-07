import 'package:flutter/material.dart';
import 'package:woofpedia/ui/loading.dart';

class EnterBreed extends StatelessWidget {
  const EnterBreed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 125),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Woofpedia",
                style: TextStyle(
                    fontFamily: 'BebasNeue', color: Colors.grey, fontSize: 50),
              ),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: "Enter breed",
                  labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.grey),
                    tooltip: 'Done',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Loading(name: textController.text.trim())));
                    },
                  ),
                ),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.grey),
                onSubmitted: (text) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Loading(name: text.trim())));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
