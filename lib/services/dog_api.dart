import 'dart:convert';
import 'package:http/http.dart';

class DogApi{

  String inputBreedName;
  String name = 'Could not get details!';
  String weight = '-N/A-';
  String height = '-N/A-';
  String lifeSpan = '-N/A-';
  String temperament = '-N/A-';
  String imgRefId = '-N/A-';
  String imgUrl = '-N/A-';

  DogApi({required this.inputBreedName});

  Future<void> getData() async{
    try{
      Response response = await get(
          Uri.parse("https://api.thedogapi.com/v1/breeds/search?q=$inputBreedName")
      );
      List<dynamic> data = jsonDecode(response.body);
      name = data[0]['name'];
      weight = "${data[0]['weight']['metric']} kg";
      height = "${data[0]['height']['metric']} cm";
      lifeSpan = data[0]['life_span'];
      temperament = "These dogs are ${data[0]['temperament'].toString().toLowerCase()}.";
      imgRefId = data[0]['reference_image_id'];

      Response newResponse = await get(
        Uri.parse("https://api.thedogapi.com/v1/images/$imgRefId")
      );

      Map newData = jsonDecode(newResponse.body);
      imgUrl = newData['url'];

    }

    catch (e){
      print('Caught error: $e');
    }
  }
}