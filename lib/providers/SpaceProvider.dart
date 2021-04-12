import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kost_nyaman/models/SpaceModel.dart';

class SpaceProvider extends ChangeNotifier {
  getRecomendedSpaces() async {
    var response =
        await http.get('http://bwa-cozy.herokuapp.com/recommended-spaces');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<SpaceModel> spaces =
          data.map((item) => SpaceModel.fromJson(item)).toList();
      return spaces;
    } else {
      return <SpaceModel>[];
    }
  }
}
